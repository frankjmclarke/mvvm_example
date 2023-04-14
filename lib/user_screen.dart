import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example/user_view_model.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
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
                      SizedBox(height: 10),
                      Text(user.age.toString()),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserViewModel>(context, listen: false)
                    .fetchUser();
              },
              child: Text("Fetch User"),
            ),
          ],
        ),
      ),
    );
  }
}
