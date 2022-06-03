import 'dart:convert';
import 'dart:io';

import 'package:customer/model/record_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecordController extends GetxController {
  var recordList = <RecordModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    //postDataInfo();
  }

  postDataInfo() async {
    var response =
        await http.patch(Uri.parse("http://10.0.2.2:5000/api/record"),
            body: ({
              "id": 1.toString(),
              "Locations": "",
              "CustomerId": 1.toString(),
              "ProjectId": 1.toString(),
              "RecordDate": "DateTime.now()",
              "RecordHour": 23.toString(),
              "ReportSummary": "bu bir deneme metnidir"
            }));
    print(response.body);
  }

  Future<RecordModel?> fetchDataApi() async {
    var response = await http.post(Uri.http('10.0.2.2:5000', 'api/record'),
        body: ({
          "id": 1.toString(),
          "Locations": "asdasdad",
          "CustomerId": 1.toString(),
          "ProjectId": 1.toString(),
          "RecordDate": DateTime.now().toString(),
          "RecordHour": 23.toString(),
          "ReportSummary": "bu bir deneme metnidir"
        }));
    var data = response.body;
    print(data);
    if (response.statusCode == 201) {
      String responseString = response.body;
      return RecordModel.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }

  Future<RecordModel> createRecord() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/record'),
      headers: <String, String>{
        'Content-Type': 'application/x--www-form-urlencoded; charset=UTF-8',
      },
      body: jsonEncode(
          [{"Locations": "asdasdad", "ReportSummary": "bu bir deneme metnidir"}]),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return RecordModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Post işlemi başarısız');
    }
  }

  void dataYolla() async {
    var data = {
      "id": 1.toString(),
      "CustomerId": 1.toString(),
      "ProjectId": 1.toString(),
      "Locations": "asdasdad",
      "RecordDate": DateTime.now().toString(),
      "RecordHour": 23.toString(),
      "ReportSummary": "bu bir deneme metnidir"
    };
    var header = {'content-Type': "application/json"};
    String body = json.encode(data);

    http.post(Uri.parse("http://10.0.2.2:5000/api/record"),
        body: body, headers: header);
    print(body);
  }

  Future<void> fetchUserData() async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2:5000/api/record"));

    // if (response.statusCode == 200) {
    //   for (final item in jsonDecode(response.body)) {
    //     RecordModel _recordModel = RecordModel.fromJson(item);

    //     recordList.add(RecordModel(
    //         CustomerId: _recordModel.CustomerId,
    //         Locations: _recordModel.Locations,
    //         ProjectId: _recordModel.ProjectId,
    //         RecordDate: _recordModel.RecordDate,
    //         RecordHour: _recordModel.RecordHour,
    //         ReportSummary: _recordModel.ReportSummary,
    //         id: _recordModel.id));
    //   }
    //   isLoading.value = true;
    //   print(response.body);
    //   print(" list geliyor mu ${recordList.length}");
    // } else {
    //   Get.snackbar(
    //       "Error", 'server responsed :${response.reasonPhrase.toString()}');
    // }
  }
}
