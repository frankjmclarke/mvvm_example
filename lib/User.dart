import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int age;

  User({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

class UserRepository {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return User(name: "John Doe", age: 30);
  }
}
