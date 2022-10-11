import 'package:flutter/cupertino.dart';

import 'package:small_deals/auth/data/models/user_model.dart';
import 'package:small_deals/auth/data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  late AuthRepository authRepository;
  AuthProvider({
    required this.authRepository,
  });

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  register({
    required String name,
    required String email,
    required String password,
  }) async {
    setIsLoading(true);

    _user = await authRepository.register(
      name: name,
      email: email,
      password: password,
    );

    _isLoading = false;
    notifyListeners();
  }

  login({
    required String email,
    required String password,
  }) async {
    setIsLoading(true);

    _user = await authRepository.login(
      email: email,
      password: password,
    );

    _isLoading = false;
    notifyListeners();
  }
}
