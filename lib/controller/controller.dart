import 'package:get/get.dart';
import 'package:tast_app/model/model.dart';
import 'package:tast_app/sarvice/api_sarvice.dart';

class UserController extends GetxController {
 var users = <UserModel>[].obs;
  var filteredUsers = <UserModel>[].obs;
  var isLoading = false.obs;
 
   @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

 Future<List<UserModel>> getUsers() async {
    return await ApiService.fetchUsers();
  }



  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final data = await getUsers();
      users.value = data;
      filteredUsers.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load users");
    } finally {
      isLoading.value = false;
    }
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      filteredUsers.value = users;
    } else {
      filteredUsers.value = users
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}