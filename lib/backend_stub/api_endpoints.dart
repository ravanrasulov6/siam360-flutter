// API endpoints constants
// 
// Placeholder endpoint paths for future backend integration.

class ApiEndpoints {
  ApiEndpoints._();
  
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String verifyOtp = '/auth/verify-otp';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  
  // User
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/profile';
  
  // Products
  static const String products = '/products';
  static const String productById = '/products/{id}';
  static const String productCategories = '/products/categories';
  static const String productStock = '/products/{id}/stock';
  
  // Sales / POS
  static const String sales = '/sales';
  static const String saleById = '/sales/{id}';
  static const String createSale = '/sales';
  
  // Reservations
  static const String reservations = '/reservations';
  static const String reservationById = '/reservations/{id}';
  static const String createReservation = '/reservations';
  
  // Requests
  static const String requests = '/requests';
  static const String requestById = '/requests/{id}';
  
  // Reports
  static const String dashboardStats = '/reports/dashboard';
  static const String salesReport = '/reports/sales';
  static const String productsReport = '/reports/products';
}
