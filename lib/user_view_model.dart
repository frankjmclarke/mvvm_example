import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'user.dart';

@injectable
class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository);

  User? _user;
  User? get user => _user;

  Future<void> fetchUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }
}
@module
abstract class RegisterModule {
  @LazySingleton(env: ['prod'])
  UserRepository get userRepository => UserRepository();

  @preResolve
  @LazySingleton(env: ['dev', 'test'])
  Future<UserRepository> get getUserRepositoryAsync =>
      Future.value(UserRepository());
}



