# Deployment Guide

## Pre-Deployment Checklist

### 1. Firebase Configuration
- [ ] Firebase project created
- [ ] Android app registered
- [ ] iOS app registered
- [ ] `google-services.json` added to `android/app/`
- [ ] `GoogleService-Info.plist` added to `ios/Runner/`
- [ ] Firebase config in `lib/firebase_options.dart` updated

### 2. Security Rules
- [ ] Firestore rules deployed: `firebase deploy --only firestore:rules`
- [ ] Storage rules deployed: `firebase deploy --only storage:rules`
- [ ] Rules tested in Firebase console

### 3. Cloud Functions
- [ ] Functions installed: `cd functions && npm install`
- [ ] Functions deployed: `firebase deploy --only functions`
- [ ] Function logs verified

### 4. App Configuration
- [ ] App version updated in `pubspec.yaml`
- [ ] Bundle ID/Package name configured
- [ ] App icons added
- [ ] Splash screen configured

### 5. Build Configuration

#### Android
- [ ] Signing key generated
- [ ] `key.properties` configured
- [ ] `build.gradle` release config updated
- [ ] ProGuard rules configured

#### iOS
- [ ] Signing certificate configured
- [ ] Provisioning profile added
- [ ] Info.plist permissions configured

### 6. Testing
- [ ] Unit tests passing: `flutter test`
- [ ] Widget tests passing
- [ ] Integration tests on physical devices
- [ ] Firebase connection verified

### 7. Store Preparation

#### Google Play Store
- [ ] Developer account active
- [ ] App listing created
- [ ] Screenshots prepared (phone, tablet, 7-inch)
- [ ] Feature graphic created
- [ ] Privacy policy link added
- [ ] Content rating completed
- [ ] Data safety form completed

#### Apple App Store
- [ ] Developer account active
- [ ] App Store Connect listing created
- [ ] Screenshots prepared (all required sizes)
- [ ] App preview video (optional)
- [ ] Privacy policy link added
- [ ] App review information completed

## Build Commands

### Android Release Build
```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended)
flutter build appbundle --release

# Output location
# build/app/outputs/bundle/release/app-release.aab
```

### iOS Release Build
```bash
# Build for App Store
flutter build ios --release

# Then open Xcode and archive
open ios/Runner.xcworkspace
```

## Deployment Steps

### Android Deployment

1. **Build the App Bundle**
   ```bash
   flutter build appbundle --release
   ```

2. **Upload to Google Play Console**
   - Go to Google Play Console
   - Select your app
   - Navigate to Release > Production
   - Upload the `.aab` file
   - Complete the release notes
   - Submit for review

3. **Monitor Rollout**
   - Check for crashes in Play Console
   - Monitor user feedback
   - Review Firebase Analytics

### iOS Deployment

1. **Build in Xcode**
   ```bash
   flutter build ios --release
   open ios/Runner.xcworkspace
   ```

2. **Archive and Upload**
   - In Xcode: Product > Archive
   - Select archive > Distribute App
   - Choose App Store Connect
   - Follow upload wizard

3. **Submit for Review**
   - Go to App Store Connect
   - Select app version
   - Complete required information
   - Submit for review

## Post-Deployment

### Monitoring
- [ ] Firebase Crashlytics configured
- [ ] Firebase Analytics tracking events
- [ ] Cloud Function logs monitored
- [ ] User feedback reviewed

### Maintenance
- [ ] Regular dependency updates
- [ ] Security patches applied
- [ ] Firebase quota monitored
- [ ] Performance metrics reviewed

## Rollback Procedure

### Android
1. Go to Google Play Console
2. Navigate to Release > Production
3. Create new release with previous version
4. Deactivate problematic version

### iOS
1. Go to App Store Connect
2. Remove app from sale
3. Submit previous version if available
4. Notify users of issue

## Troubleshooting

### Common Issues

**Firebase Connection Failed**
- Verify `google-services.json` / `GoogleService-Info.plist`
- Check Firebase project configuration
- Ensure package name/bundle ID matches

**Build Failed**
- Run `flutter clean`
- Delete `build/` directory
- Run `flutter pub get`
- Check for dependency conflicts

**Security Rules Rejected**
- Test rules in Firebase console
- Verify rule syntax
- Check for breaking changes

## Support

For deployment issues:
- Check Flutter documentation
- Review Firebase documentation
- Contact development team

---

**Note**: Always test thoroughly before deploying to production.
