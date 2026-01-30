# Architecture Overview

## System Architecture

The Student Counseling App follows Clean Architecture principles with a clear separation of concerns and modular design.

## Layer Structure

```
┌─────────────────────────────────────────────┐
│           Presentation Layer                │
│  (UI, Widgets, Screens, State Management)   │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│            Domain Layer                     │
│     (Business Logic, Use Cases)             │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│             Data Layer                      │
│    (Models, Repositories, Services)         │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│          Firebase Backend                   │
│  (Auth, Firestore, Functions, FCM)          │
└─────────────────────────────────────────────┘
```

## Directory Structure

```
lib/
├── core/
│   ├── constants/          # Application constants
│   │   ├── user_roles.dart
│   │   └── firestore_constants.dart
│   ├── services/           # Core services
│   │   ├── firebase_service.dart
│   │   ├── messaging_service.dart
│   │   ├── assignment_service.dart
│   │   ├── session_service.dart
│   │   ├── notification_service.dart
│   │   └── encryption_service.dart
│   └── utils/              # Utility functions
│
├── data/
│   ├── models/             # Data models
│   │   ├── user_model.dart
│   │   ├── message_model.dart
│   │   ├── session_model.dart
│   │   ├── assignment_model.dart
│   │   ├── group_model.dart
│   │   └── followup_model.dart
│   └── repositories/       # Data repositories
│
├── domain/
│   ├── entities/           # Business entities
│   └── usecases/           # Business logic
│
└── presentation/
    ├── providers/          # State management
    │   └── auth_provider.dart
    ├── screens/            # UI screens
    │   ├── splash_screen.dart
    │   ├── role_selection_screen.dart
    │   ├── home_screen.dart
    │   ├── student/
    │   ├── psychiatrist/
    │   ├── admin/
    │   ├── messaging/
    │   └── group/
    └── widgets/            # Reusable widgets
        ├── message_input_widget.dart
        └── role_card_widget.dart
```

## Component Responsibilities

### Presentation Layer
- **Screens**: Complete page views
- **Widgets**: Reusable UI components
- **Providers**: State management with Provider pattern
- **Purpose**: Display data and handle user interaction

### Domain Layer
- **Entities**: Core business objects
- **Use Cases**: Business logic operations
- **Purpose**: Implement business rules independent of UI and data sources

### Data Layer
- **Models**: Data transfer objects
- **Repositories**: Abstract data access
- **Services**: Firebase service implementations
- **Purpose**: Manage data persistence and external services

### Core Layer
- **Constants**: Application-wide constants
- **Services**: Cross-cutting concerns
- **Utils**: Helper functions
- **Purpose**: Shared functionality across layers

## Firebase Integration

### Authentication
- Anonymous authentication
- Custom claims for roles
- Session management

### Firestore
- User profiles
- Messages
- Sessions
- Assignments
- Groups
- Follow-ups

### Cloud Functions
- Scheduled follow-up checks
- Automated notifications
- Session-triggered follow-ups

### Cloud Messaging
- Push notifications
- Follow-up reminders
- Session alerts

## Security Architecture

### Authentication Flow
```
User Opens App
     ↓
Anonymous Sign-In (Firebase Auth)
     ↓
Role Assignment (Custom Claims)
     ↓
Token Generation
     ↓
Access Control (Security Rules)
```

### Data Access Control
```
Request → Firebase Auth → Security Rules → Firestore
   ↓           ↓              ↓              ↓
User ID → Verify Token → Check Role → Grant/Deny
```

## State Management

Using Provider pattern:
- AuthProvider: Authentication state
- Future providers: Messaging, Sessions, etc.

## Design Patterns

### Repository Pattern
Abstract data sources behind repositories

### Service Layer Pattern
Encapsulate business logic in services

### Provider Pattern
Manage and provide state across widgets

### Factory Pattern
Create objects from serialized data

## Scalability Considerations

### Firebase Auto-Scaling
- Firestore: Automatic scaling
- Cloud Functions: Concurrent execution
- Authentication: Global infrastructure

### Code Modularity
- 100-line file limit
- Clear separation of concerns
- Easy to test and maintain

### Performance
- Efficient queries with indexes
- Pagination for large datasets
- Caching where appropriate

## Testing Strategy

### Unit Tests
- Models: Serialization/deserialization
- Services: Business logic
- Utilities: Helper functions

### Widget Tests
- UI components
- User interactions
- State changes

### Integration Tests
- End-to-end flows
- Firebase integration
- Authentication flows

## Deployment Architecture

### Android
```
Flutter App → APK/AAB → Google Play Store
```

### iOS
```
Flutter App → IPA → App Store Connect → App Store
```

### Firebase Backend
```
Security Rules → Firebase Console
Cloud Functions → Firebase CLI
```

## Monitoring and Analytics

### Firebase Analytics
- Anonymous usage tracking
- Feature adoption metrics
- Performance monitoring

### Crashlytics
- Crash reporting
- Error tracking
- Performance issues

## Future Enhancements

### Planned Improvements
1. Offline support with local caching
2. Real-time typing indicators
3. Rich media messages
4. Advanced search functionality
5. AI-powered insights (privacy-safe)

### Scalability Paths
1. Microservices if needed
2. CDN for static assets
3. Load balancing
4. Database sharding (if required)

## Security Considerations

### OWASP Compliance
- Input validation
- Secure storage
- Network security
- Code quality

### Privacy by Design
- Minimal data collection
- Anonymous by default
- No tracking
- User control

## Maintenance

### Regular Tasks
- Dependency updates
- Security patches
- Performance optimization
- Bug fixes

### Monitoring
- Firebase quotas
- Error rates
- Performance metrics
- User feedback
