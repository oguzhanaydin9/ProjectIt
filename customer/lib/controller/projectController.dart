import 'dart:convert';

import 'package:customer/model/project_model.dart';
import 'package:customer/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class ProjectController extends GetxController {
  var projectList = <ProjectModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetcProjectData();
  }

  Future<void> checkUserInfo() async {}

  Future<void> fetcProjectData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:5000/api/project"));

    if (response.statusCode == 200) {
      for (final item in jsonDecode(response.body)) {
        ProjectModel _projectModel = ProjectModel.fromJson(item);

        projectList.add(ProjectModel(
            ProjectName: _projectModel.ProjectName, id: _projectModel.id));
      }
      isLoading.value = true;
      print(response.body);
      print(" list geliyor mu ${projectList.length}");
    } else {
      Get.snackbar(
          "Error", 'server responsed :${response.reasonPhrase.toString()}');
    }
  }
}
