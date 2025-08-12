# Flutter E-commerce Setup Instructions

## Prerequisites

1. **Flutter SDK**: Install Flutter SDK (>=3.0.0)
2. **Firebase Account**: Create a Firebase project
3. **Stripe Account**: Create a Stripe account for payments
4. **IDE**: Android Studio, VS Code, or IntelliJ IDEA

## Step 1: Flutter Setup

1. Install Flutter SDK from [flutter.dev](https://flutter.dev)
2. Add Flutter to your PATH
3. Run `flutter doctor` to verify installation
4. Install required IDE plugins

## Step 2: Firebase Setup

### Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project
3. Enable Google Analytics (optional)

### Configure Authentication
1. Go to Authentication > Sign-in method
2. Enable Email/Password authentication
3. Optionally enable other providers

### Setup Firestore Database
1. Go to Firestore Database
2. Create database in test mode
3. Choose a location close to your users

### Add Firebase to Flutter App

#### For Android:
1. Click "Add app" and select Android
2. Enter package name: `com.example.flutter_ecommerce`
3. Download `google-services.json`
4. Place it in `android/app/` directory

#### For iOS:
1. Click "Add app" and select iOS
2. Enter bundle ID: `com.example.flutterEcommerce`
3. Download `GoogleService-Info.plist`
4. Add it to `ios/Runner/` directory in Xcode

## Step 3: Stripe Setup

1. Create account at [stripe.com](https://stripe.com)
2. Go to Developers > API keys
3. Copy your Publishable key and Secret key
4. Update `lib/utils/constants.dart`:

```dart
static const String stripePublishableKey = 'pk_test_your_key_here';
static const String stripeSecretKey = 'sk_test_your_key_here';
```

## Step 4: Install Dependencies

Run in your project directory:
```bash
flutter pub get
```

## Step 5: Configure Firebase Security Rules

### Firestore Rules
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Products are readable by all, writable by admins only
    match /products/{productId} {
      allow read: if true;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.isAdmin == true;
    }
    
    // Orders are readable/writable by owner and admins
    match /orders/{orderId} {
      allow read, write: if request.auth != null && 
        (resource.data.userId == request.auth.uid || 
         get(/databases/$(database)/documents/users/$(request.auth.uid)).data.isAdmin == true);
    }
  }
}
```

## Step 6: Add Sample Data

### Create Admin User
1. Run the app and register with email: `admin@example.com`
2. Go to Firestore Console
3. Find the user document and set `isAdmin: true`

### Add Sample Products
Use the admin panel in the app or add directly to Firestore:

```json
{
  "name": "iPhone 14 Pro",
  "description": "Latest iPhone with advanced camera system",
  "price": 999.99,
  "category": "Electronics",
  "images": ["https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg"],
  "stock": 50,
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00.000Z"
}
```

## Step 7: Run the App

```bash
# For Android
flutter run

# For iOS (requires macOS and Xcode)
flutter run -d ios

# For web (limited functionality)
flutter run -d chrome
```

## Step 8: Testing Payments

### Test Cards (Stripe)
- Success: `4242 4242 4242 4242`
- Decline: `4000 0000 0000 0002`
- Requires authentication: `4000 0025 0000 3155`

Use any future expiry date and any 3-digit CVC.

## Troubleshooting

### Common Issues

1. **Firebase not initialized**
   - Ensure `google-services.json` is in correct location
   - Check package name matches Firebase configuration

2. **Stripe payment fails**
   - Verify API keys are correct
   - Check internet connection
   - Ensure test mode is enabled

3. **Build errors**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Check Flutter and Dart versions

### Debug Commands
```bash
flutter doctor -v
flutter clean
flutter pub get
flutter pub deps
```

## Production Deployment

### Android
1. Generate signing key
2. Configure `android/app/build.gradle`
3. Build APK: `flutter build apk --release`
4. Upload to Google Play Store

### iOS
1. Configure signing in Xcode
2. Build: `flutter build ios --release`
3. Archive and upload to App Store

### Security Checklist
- [ ] Update Firestore security rules
- [ ] Use production Stripe keys
- [ ] Enable Firebase App Check
- [ ] Configure proper CORS settings
- [ ] Review and test all user flows

## Support

For issues and questions:
1. Check Flutter documentation
2. Review Firebase documentation
3. Check Stripe documentation
4. Search Stack Overflow
5. Create GitHub issue

## Next Steps

After setup, consider:
- Adding push notifications
- Implementing analytics
- Adding more payment methods
- Enhancing UI/UX
- Adding tests
- Setting up CI/CD