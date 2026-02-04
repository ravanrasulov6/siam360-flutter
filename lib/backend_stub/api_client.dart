// Backend API client stub
// 
// This is a placeholder for future backend integration.
// Replace with actual implementation when connecting to real API.

import 'dart:async';

class ApiClient {
  ApiClient._();
  
  static final ApiClient instance = ApiClient._();
  
  /// Base URL for API endpoints
  static const String baseUrl = 'https://api.siam360.example.com';
  
  /// Default headers
  Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  /// Auth token (set after login)
  String? _authToken;
  
  void setAuthToken(String token) {
    _authToken = token;
  }
  
  void clearAuthToken() {
    _authToken = null;
  }
  
  Map<String, String> get authHeaders => {
    ...defaultHeaders,
    if (_authToken != null) 'Authorization': 'Bearer $_authToken',
  };
  
  /// Placeholder GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    // TODO: Implement actual HTTP GET request
    await Future.delayed(const Duration(milliseconds: 500));
    return {'success': true, 'data': null};
  }
  
  /// Placeholder POST request
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    // TODO: Implement actual HTTP POST request
    await Future.delayed(const Duration(milliseconds: 500));
    return {'success': true, 'data': null};
  }
  
  /// Placeholder PUT request
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    // TODO: Implement actual HTTP PUT request
    await Future.delayed(const Duration(milliseconds: 500));
    return {'success': true, 'data': null};
  }
  
  /// Placeholder DELETE request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    // TODO: Implement actual HTTP DELETE request
    await Future.delayed(const Duration(milliseconds: 500));
    return {'success': true};
  }
}
