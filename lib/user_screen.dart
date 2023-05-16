import 'package:flutter/material.dart';
import 'user_view_model.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserViewModel>(
              builder: (context, userViewModel, child) {
                final user = userViewModel.user;
                if (user != null) {
                  return Column(
                    children: [
                      Text(user.name),
                      const SizedBox(height: 10),
                      Text(user.age.toString()),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserViewModel>(context, listen: false)
                    .fetchUser();
              },
              child: const Text("Fetch User"),
            ),
          ],
        ),
      ),
    );
  }
}
