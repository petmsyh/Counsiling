# Quick Start Guide

Get the Student Counseling App up and running in minutes!

## Prerequisites

- Flutter SDK 3.0.0+
- Android Studio or VS Code
- Firebase account
- Git

## 5-Minute Setup

### 1. Clone Repository
\`\`\`bash
git clone https://github.com/petmsyh/Counsiling.git
cd Counsiling
\`\`\`

### 2. Install Dependencies
\`\`\`bash
flutter pub get
\`\`\`

### 3. Configure Firebase

#### Option A: Use Demo Config (for testing)
The app includes placeholder Firebase config that you can use for initial testing.

#### Option B: Use Your Firebase Project (recommended)
1. Create Firebase project at https://console.firebase.google.com
2. Download config files:
   - Android: \`google-services.json\` → \`android/app/\`
   - iOS: \`GoogleService-Info.plist\` → \`ios/Runner/\`
3. Update \`lib/firebase_options.dart\` with your credentials

See **FIREBASE_SETUP.md** for detailed instructions.

### 4. Enable Firebase Services

In Firebase Console:
1. **Authentication** → Enable "Anonymous"
2. **Firestore** → Create database (test mode initially)
3. **Cloud Messaging** → Already enabled

### 5. Deploy Security Rules
\`\`\`bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Update .firebaserc with your project ID

# Deploy rules
firebase deploy --only firestore:rules,storage:rules
\`\`\`

### 6. Deploy Cloud Functions (Optional)
\`\`\`bash
cd functions
npm install
firebase deploy --only functions
cd ..
\`\`\`

### 7. Run the App
\`\`\`bash
flutter run
\`\`\`

## First Use

1. Launch app
2. Select "Student" role
3. Explore the anonymous interface
4. No personal information required!

## Project Structure

\`\`\`
lib/
├── core/               # Core services & utilities
├── data/               # Data models
├── presentation/       # UI screens & widgets
├── firebase_options.dart
└── main.dart
\`\`\`

## Key Features to Try

- ✅ Anonymous sign-in
- ✅ Role selection (Student/Psychiatrist/Admin)
- ✅ Secure messaging interface
- ✅ Group venting sessions
- ✅ Session history

## Troubleshooting

### "Firebase not initialized"
- Check \`google-services.json\` location
- Verify package name matches

### "Permission denied"
- Deploy Firestore rules
- Check user is authenticated

### Build errors
\`\`\`bash
flutter clean
flutter pub get
flutter run
\`\`\`

## Documentation

- **README.md** - Full documentation
- **FIREBASE_SETUP.md** - Detailed Firebase setup
- **DEPLOYMENT.md** - Deployment guide
- **ARCHITECTURE.md** - System architecture
- **SECURITY.md** - Security details

## Next Steps

1. Read **README.md** for complete features
2. Review **ARCHITECTURE.md** for system design
3. Check **SECURITY.md** for security details
4. Follow **DEPLOYMENT.md** for production deployment

## Support

- Documentation: Check .md files in root
- Issues: GitHub Issues
- Firebase: Firebase Console logs

## Development Mode

The app runs in development mode by default with:
- Debug logging enabled
- Hot reload supported
- Test Firebase configuration

## Production Deployment

When ready for production:
1. Configure real Firebase project
2. Set up app signing
3. Follow **DEPLOYMENT.md**
4. Deploy to app stores

---

**Ready in 5 minutes!** 🚀
