# Changelog

All notable changes to the Student Counseling App will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-30

### Added
- Anonymous authentication system using Firebase
- Role-based access control (Student, Psychiatrist, Administrator)
- Secure one-to-one messaging between students and psychiatrists
- Permanent psychiatrist assignment system
- Counseling memory/case history tracking
- Session notes and observations
- Automated follow-up system with Cloud Functions
- Firebase Cloud Messaging (FCM) notifications
- Group venting feature for anonymous group sessions
- Comprehensive Firebase Security Rules
- OWASP Mobile Security compliance
- Clean architecture implementation
- Modular design with files under 100 lines
- Encryption service for message security
- Complete Android configuration
- Complete iOS configuration
- Comprehensive documentation (README, SECURITY, PRIVACY_POLICY, DEPLOYMENT)
- Unit tests for models

### Security
- Implemented Firebase Authentication with anonymous sign-in
- Role-based access control via custom claims
- Firestore Security Rules for data protection
- Encryption in transit (TLS) and at rest (Firebase)
- No PII collection or storage
- Device identifier protection
- OWASP Mobile Application Security best practices

### Documentation
- Setup and installation instructions
- Firebase configuration guide
- Security documentation
- Privacy policy
- Deployment guide
- Code quality standards

## [Unreleased]

### Planned Features
- Enhanced message encryption
- Offline message queue
- Advanced session scheduling
- Group video sessions
- Crisis intervention features
- Multi-language support
- Accessibility improvements
- Advanced analytics (privacy-safe)
