import 'dart:convert';

import 'package:customer/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/customer_model.dart';

class CustomerController extends GetxController {
  var userList = <CustomerModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetcCustomerData();
  }

  Future<void> checkUserInfo() async {}

  Future<void> fetcCustomerData() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/api/customer"));

    if (response.statusCode == 200) {
      for (final item in jsonDecode(response.body)) {
        CustomerModel _customerModel = CustomerModel.fromJson(item);

        userList.add(CustomerModel(
            customerName: _customerModel.customerName,
            id: _customerModel.id));
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
