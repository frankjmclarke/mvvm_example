import 'package:injectable/injectable.dart';
import 'user.dart';
import 'user_view_model.dart';

@module
abstract class AppModule {
  @lazySingleton
  UserRepository get userRepository => UserRepository();

 //@factory
  //UserViewModel get userViewModel => UserViewModel(userRepository);
}
