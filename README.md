# Flutter E-commerce App

A complete mobile e-commerce application built with Flutter, Firebase, and Stripe integration.

## Features

### User Features
- **Authentication**: Sign up, sign in, and sign out with Firebase Auth
- **Product Catalog**: Browse products with categories and search functionality
- **Shopping Cart**: Add/remove items, update quantities
- **Payment Processing**: Secure payments with Stripe integration
- **User Profile**: View and manage user information
- **Order History**: Track past orders and their status

### Admin Features
- **Admin Dashboard**: Overview of products and categories
- **Product Management**: Add, edit, and delete products
- **Order Management**: View and update order statuses
- **Analytics**: Basic statistics and insights

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Firestore, Auth, Storage)
- **Payment**: Stripe


## Setup Instructions

### Prerequisites
- Flutter SDK (>=3.0.0)
- Firebase project
- Stripe account

### Firebase Setup
1. Create a new Firebase project
2. Enable Authentication (Email/Password)
3. Create Firestore database
4. Add your app to Firebase project
5. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)

### Stripe Setup
1. Create a Stripe account
2. Get your publishable and secret keys
3. Update `lib/utils/constants.dart` with your keys

### Installation
1. Clone the repository
2. Run `flutter pub get`
3. Configure Firebase and Stripe keys
4. Run `flutter run`

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user_model.dart
│   ├── product_model.dart
│   ├── cart_item_model.dart
│   └── order_model.dart
├── providers/                # State management
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   └── product_provider.dart
├── screens/                  # UI screens
│   ├── auth/
│   ├── home/
│   ├── cart/
│   ├── profile/
│   └── admin/
├── widgets/                  # Reusable widgets
├── services/                 # External services
│   └── payment_service.dart
└── utils/                    # Constants and utilities
    └── constants.dart
```

## Key Features Implementation

### Authentication
- Firebase Auth integration
- Email/password authentication
- User role management (admin/user)
- Persistent login state

### Product Management
- Firestore integration for product data
- Category-based filtering
- Search functionality
- Image handling with caching

### Shopping Cart
- Local state management with Provider
- Persistent cart across app sessions
- Quantity management
- Price calculations

### Payment Processing
- Stripe payment integration
- Secure payment intent creation
- Payment sheet presentation
- Order confirmation

### Admin Panel
- Product CRUD operations
- Order management
- Basic analytics
- Admin-only access control

## Security Considerations

- Firebase Security Rules for Firestore
- Admin role verification
- Secure API key management
- Input validation and sanitization

## Future Enhancements

- Push notifications
- Wishlist functionality
- Product reviews and ratings
- Advanced search and filters
- Multi-language support
- Dark mode theme
- Social authentication
- Advanced analytics



By AnicetJonhia