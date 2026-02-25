import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tast_app/controller/controller.dart';
import 'package:tast_app/model/model.dart';
import 'package:tast_app/view/details_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME", style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: FutureBuilder<List<UserModel>>(
        future: controller.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading users"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No users found"));
          }

          final users = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async {
              controller.getUsers();
            },
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () {
                      Get.to(() => UserDetailScreen(user: user));
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
