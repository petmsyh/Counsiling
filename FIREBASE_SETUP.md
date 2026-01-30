# Firebase Setup Guide

This guide will help you configure Firebase for the Student Counseling App.

## Prerequisites

1. Google account
2. Flutter installed
3. Firebase CLI installed

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Enter project name: `counseling-app` (or your preferred name)
4. Disable Google Analytics (optional, for privacy)
5. Click "Create project"

## Step 2: Register Android App

1. In Firebase Console, click Android icon
2. Enter package name: `com.example.counseling_app`
3. App nickname: `Counseling App Android`
4. Click "Register app"
5. Download `google-services.json`
6. Place in: `android/app/google-services.json`

## Step 3: Register iOS App

1. In Firebase Console, click iOS icon
2. Enter bundle ID: `com.example.counselingApp`
3. App nickname: `Counseling App iOS`
4. Click "Register app"
5. Download `GoogleService-Info.plist`
6. Place in: `ios/Runner/GoogleService-Info.plist`

## Step 4: Enable Firebase Services

### Authentication
1. Go to Authentication > Sign-in method
2. Enable "Anonymous" authentication
3. Save

### Firestore Database
1. Go to Firestore Database
2. Click "Create database"
3. Start in test mode (we'll deploy rules later)
4. Choose location closest to users
5. Click "Enable"

### Cloud Messaging
1. Go to Cloud Messaging
2. Already enabled by default
3. Note: No additional setup needed

### Cloud Functions
1. Upgrade to Blaze plan (pay-as-you-go)
2. Note: Free tier generous, costs minimal

## Step 5: Update Firebase Configuration

Edit `lib/firebase_options.dart`:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ANDROID_API_KEY',
  appId: 'YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_SENDER_ID',
  projectId: 'your-project-id',
  storageBucket: 'your-project-id.appspot.com',
);

static const FirebaseOptions ios = FirebaseOptions(
  apiKey: 'YOUR_IOS_API_KEY',
  appId: 'YOUR_IOS_APP_ID',
  messagingSenderId: 'YOUR_SENDER_ID',
  projectId: 'your-project-id',
  storageBucket: 'your-project-id.appspot.com',
  iosBundleId: 'com.example.counselingApp',
);
```

Find these values in Firebase Console > Project Settings.

## Step 6: Deploy Security Rules

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in project:
   ```bash
   cd /path/to/Counsiling
   firebase init
   ```
   Select:
   - Firestore
   - Functions
   - Storage

4. Update `.firebaserc` with your project ID:
   ```json
   {
     "projects": {
       "default": "your-project-id"
     }
   }
   ```

5. Deploy rules:
   ```bash
   firebase deploy --only firestore:rules,storage:rules
   ```

## Step 7: Setup Cloud Functions

1. Navigate to functions directory:
   ```bash
   cd functions
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Deploy functions:
   ```bash
   firebase deploy --only functions
   ```

## Step 8: Setup Firestore Indexes

Deploy indexes if needed:
```bash
firebase deploy --only firestore:indexes
```

## Step 9: Test Configuration

1. Run the app:
   ```bash
   flutter run
   ```

2. Try anonymous sign-in
3. Check Firebase Console for new user
4. Verify Firestore data creation

## Security Checklist

- [ ] Anonymous authentication enabled
- [ ] Firestore rules deployed
- [ ] Storage rules deployed
- [ ] Cloud Functions deployed
- [ ] API keys configured
- [ ] Package names match
- [ ] Test on physical device

## Firestore Security Rules Overview

The deployed rules ensure:
- Users can only read/write their own data
- Messages accessible only to sender/receiver
- Sessions restricted to assigned pairs
- Assignments controlled by admins
- Groups readable by all authenticated users

## Cloud Functions Overview

Deployed functions:
- `checkFollowUps`: Runs daily to check pending follow-ups
- `onSessionCreated`: Creates follow-up when session created

## Monitoring

### Firebase Console
- Authentication: Monitor user count
- Firestore: Check database usage
- Functions: View execution logs
- Messaging: Track notification delivery

### Quotas to Monitor
- Firestore: Document reads/writes
- Functions: Invocations
- Storage: Storage usage
- Messaging: Messages sent

## Troubleshooting

### "Firebase not configured"
- Check `google-services.json` location
- Verify package name matches
- Rebuild app

### "Permission denied"
- Check security rules deployed
- Verify user authenticated
- Check Firestore Console logs

### "Function not found"
- Verify functions deployed
- Check Firebase Console > Functions
- Review function logs

## Cost Optimization

### Free Tier Limits
- Firestore: 50K reads/day, 20K writes/day
- Functions: 2M invocations/month
- Storage: 5GB storage
- Auth: Unlimited

### Tips to Stay Free
- Efficient queries
- Batch operations
- Cache when possible
- Monitor usage

## Support Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev)
- [Firebase Support](https://firebase.google.com/support)

## Next Steps

After setup:
1. Test all features
2. Monitor Firebase Console
3. Review security rules
4. Plan for production deployment
