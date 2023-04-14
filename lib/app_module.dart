import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_example/user_view_model.dart';

import 'User.dart';

@module
abstract class AppModule {
  @lazySingleton
  UserRepository get userRepository => UserRepository();

  @factory
  UserViewModel get userViewModel => UserViewModel(userRepository);
}
