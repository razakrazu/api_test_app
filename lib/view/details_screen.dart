// import 'package:flutter/material.dart';
// import 'package:tast_app/model/model.dart';

// class UserDetailScreen extends StatelessWidget {
//   final UserModel user;

//   UserDetailScreen({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(user.name, style: TextStyle(fontWeight: FontWeight.w400)),centerTitle: true,
//         backgroundColor: Colors.blue[400],),
 
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Username: ${user.username}"),
//             Text("Email: ${user.email}"),
//             Text("Phone: ${user.phone}"),
//             Text("Website: ${user.website}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tast_app/model/model.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          
          

            const SizedBox(height: 150),

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("NAME:${user.username}",   style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),
                    const Divider(),
                    Text("Email:${user.email}",   style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),
                    const Divider(),
                        Text("Email:${user.phone}",   style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),               

                    const Divider(),
                     Text("Email:${user.website}",   style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.indigo),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}