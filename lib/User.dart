import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int age;

  const User({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

class UserRepository {
  Future<User> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return const User(name: "John Doe", age: 30);
  }
}
