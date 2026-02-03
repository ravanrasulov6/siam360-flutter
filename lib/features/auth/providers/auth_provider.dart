import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository/auth_repository.dart';

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository();
});

/// Current user state provider
final currentUserProvider = StateProvider<String?>((ref) => null);

/// Auth state notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AuthState.initial());

  Future<bool> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final success = await _repository.login(email, password);
      if (success) {
        state = const AuthState.authenticated();
        return true;
      } else {
        state = const AuthState.error('Giriş uğursuz oldu');
        return false;
      }
    } catch (e) {
      state = AuthState.error(e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AuthState.initial();
  }
}

/// Auth state
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.error,
  });

  const AuthState.initial() : this();
  const AuthState.loading() : this(isLoading: true);
  const AuthState.authenticated() : this(isAuthenticated: true);
  const AuthState.error(String message)
      : this(error: message);
}

/// Auth notifier provider
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
