import 'dart:convert';

import 'package:customer/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> checkUserInfo() async {}

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/api/user"));

    if (response.statusCode == 200) {
      for (final item in jsonDecode(response.body)) {
        UserModel _userModel = UserModel.fromJson(item);

        userList.add(UserModel(
            userMail: _userModel.userMail,
            password: _userModel.password,
            id: _userModel.id));
      }
      isLoading.value = true;
      print(response.body);
      print(" list geliyor mu ${userList.length}");
    } else {
      Get.snackbar(
          "Error", 'server responsed :${response.reasonPhrase.toString()}');
    }
  }
}
