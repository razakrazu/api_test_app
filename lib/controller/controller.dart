import 'package:get/get.dart';
import 'package:tast_app/model/model.dart';
import 'package:tast_app/sarvice/api_sarvice.dart';

class UserController extends GetxController {

  Future<List<UserModel>> getUsers() async {
    return await ApiService.fetchUsers();
  }
}