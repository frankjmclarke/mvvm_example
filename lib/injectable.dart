import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_example/user_view_model.dart';
import 'User.dart';
import 'app_module.dart';
final getIt = GetIt.instance;
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
  void $initGetIt(GetIt getIt, {required String environment}) {
    final gh = GetItHelper(getIt, environment);
    gh.lazySingleton<UserRepository>(() => UserRepository());
    gh.factory<UserViewModel>(() => UserViewModel(getIt<UserRepository>()));
    // Register more dependencies here...

    gh.getIt();
  }