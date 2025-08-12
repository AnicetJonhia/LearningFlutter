class Constants {
  // Stripe Keys (Replace with your actual keys)
  static const String stripePublishableKey = 'pk_test_your_publishable_key_here';
  static const String stripeSecretKey = 'sk_test_your_secret_key_here';
  
  // App Colors
  static const primaryColor = Color(0xFF8B5CF6);
  static const secondaryColor = Color(0xFF10B981);
  static const accentColor = Color(0xFFF97316);
  static const backgroundColor = Color(0xFFF8FAFC);
  static const cardColor = Color(0xFFFFFFFF);
  
  // Text Styles
  static const headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1F2937),
  );
  
  static const subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF374151),
  );
  
  static const bodyStyle = TextStyle(
    fontSize: 14,
    color: Color(0xFF6B7280),
  );
  
  // Spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
}