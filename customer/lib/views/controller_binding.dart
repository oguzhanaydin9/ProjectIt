import 'package:customer/controller/customerController.dart';
import 'package:customer/controller/logincontroller.dart';
import 'package:customer/controller/projectController.dart';
import 'package:customer/controller/recordController.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<CustomerController>(CustomerController());
    Get.put<RecordController>(RecordController());
    Get.put<ProjectController>(ProjectController());
  }
}
