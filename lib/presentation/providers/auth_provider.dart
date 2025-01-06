import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_fin/core/utils/api_service.dart';

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final String? errorMessage;

  AuthState({required this.isAuthenticated, this.token, this.errorMessage});
}

final apiService = ApiService();

class AuthStateNotifier extends Notifier<AuthState> {
  AuthStateNotifier();

  @override
  AuthState build() {
    return AuthState(isAuthenticated: false);
  }

  Future<void> login(String username, String password) async {
    state = AuthState(isAuthenticated: false);

    try {
      // final response = await apiService.post(
      //   'https://api.example.com/login',
      //   data: {
      //     'username': username,
      //     'password': password,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   state = AuthState(
      //     isAuthenticated: true,
      //   );
      // } else {
      //   state = AuthState(
      //       isAuthenticated: false, errorMessage: 'Invalid credentials');
      // }

      state = AuthState(
        isAuthenticated: true,
      );
    } catch (e) {
      state = AuthState(isAuthenticated: false, errorMessage: e.toString());
    }
  }

  void logout() {
    state = AuthState(isAuthenticated: false);
  }
}

final authProvider = NotifierProvider<AuthStateNotifier, AuthState>(
  () => AuthStateNotifier(),
);
