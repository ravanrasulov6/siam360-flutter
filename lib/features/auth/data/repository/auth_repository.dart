/// Auth repository interface
abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register({
    required String name,
    required String surname,
    required String phone,
    required String email,
    required String password,
  });
  Future<bool> verifyOtp(String otp);
  Future<void> logout();
  Future<bool> isAuthenticated();
}

/// Mock implementation of AuthRepository
class MockAuthRepository implements AuthRepository {
  bool _isLoggedIn = false;

  @override
  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock always succeeds
    _isLoggedIn = true;
    return true;
  }

  @override
  Future<bool> register({
    required String name,
    required String surname,
    required String phone,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock: accept any 6-digit code
    return otp.length == 6;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoggedIn = false;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _isLoggedIn;
  }
}
