import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tast_app/controller/controller.dart';
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
      body: Column(
        children: [

          // 🔍 SEARCH FIELD
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                controller.searchUser(value);
              },
              decoration: InputDecoration(
                hintText: "Search by name",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // 📋 LIST SECTION
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.filteredUsers.isEmpty) {
                return Center(child: Text("No users found"));
              }

              return RefreshIndicator(
                onRefresh: controller.fetchUsers,
                child: ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];

                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(user.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.email),
                            Text(user.phone),
                            // Text(user.company.name),
                          ],
                        ),
                        onTap: () {
                          Get.to(() => UserDetailScreen(user: user));
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}