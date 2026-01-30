const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

// Scheduled function to check for pending follow-ups
exports.checkFollowUps = functions.pubsub
  .schedule('every 24 hours')
  .onRun(async (context) => {
    const now = new Date();
    const tomorrow = new Date(now.getTime() + 24 * 60 * 60 * 1000);

    try {
      const followUpsSnapshot = await db
        .collection('followUps')
        .where('status', '==', 'pending')
        .where('scheduledDate', '<=', tomorrow.toISOString())
        .get();

      const notifications = [];

      for (const doc of followUpsSnapshot.docs) {
        const followUp = doc.data();
        
        // Notify psychiatrist
        const psychiatristDoc = await db
          .collection('users')
          .doc(followUp.psychiatristId)
          .get();
        
        if (psychiatristDoc.exists) {
          const psychiatristData = psychiatristDoc.data();
          if (psychiatristData.fcmToken) {
            notifications.push(
              messaging.send({
                token: psychiatristData.fcmToken,
                notification: {
                  title: 'Follow-up Reminder',
                  body: 'You have a follow-up scheduled soon',
                },
                data: {
                  type: 'followup',
                  followUpId: doc.id,
                },
              })
            );
          }
        }

        // Notify student
        const studentDoc = await db
          .collection('users')
          .doc(followUp.studentId)
          .get();
        
        if (studentDoc.exists) {
          const studentData = studentDoc.data();
          if (studentData.fcmToken) {
            notifications.push(
              messaging.send({
                token: studentData.fcmToken,
                notification: {
                  title: 'Session Reminder',
                  body: 'Your counseling session is coming up',
                },
                data: {
                  type: 'followup',
                  followUpId: doc.id,
                },
              })
            );
          }
        }
      }

      await Promise.all(notifications);
      console.log(`Sent ${notifications.length} notifications`);
      
      return null;
    } catch (error) {
      console.error('Error checking follow-ups:', error);
      throw error;
    }
  });

// Trigger when a new session is created
exports.onSessionCreated = functions.firestore
  .document('sessions/{sessionId}')
  .onCreate(async (snap, context) => {
    const session = snap.data();
    
    // Create a follow-up 7 days later
    const followUpDate = new Date();
    followUpDate.setDate(followUpDate.getDate() + 7);

    await db.collection('followUps').add({
      studentId: session.studentId,
      psychiatristId: session.psychiatristId,
      scheduledDate: followUpDate.toISOString(),
      status: 'pending',
      notes: 'Automatic follow-up after session',
    });

    return null;
  });
