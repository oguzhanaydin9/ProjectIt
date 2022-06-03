import 'package:customer/controller/customerController.dart';
import 'package:customer/controller/projectController.dart';
import 'package:customer/controller/recordController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_time_picker/date_time_picker.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  String? selectedValue = "seç";
  int _value = 1;
  int _projectValue = 1;
  final _controller = Get.find<CustomerController>();
  final _Recordcontroller = Get.find<RecordController>();
  final _projectControlller = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Müşteri Görüşme Kayıt Ekranı",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              labelText: "Location",
                              prefixIcon: Icon(Icons.location_on_rounded))),
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Müşteri Seçiniz"),
                              DropdownButton<int>(
                                value: _value,
                                onChanged: (value) => setState(() {
                                  _value = value!;
                                }),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                        _controller.userList[0].customerName),
                                    value: _controller.userList[0].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                        _controller.userList[1].customerName),
                                    value: _controller.userList[1].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                        _controller.userList[2].customerName),
                                    value: _controller.userList[2].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                        _controller.userList[3].customerName),
                                    value: _controller.userList[3].id,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: Get.width / 3),
                          Column(
                            children: [
                              Text("Proje Seçiniz"),
                              DropdownButton<int>(
                                value: _projectValue,
                                onChanged: (value) => setState(() {
                                  _projectValue = value!;
                                }),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(_projectControlller
                                        .projectList[0].ProjectName),
                                    value:
                                        _projectControlller.projectList[0].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(_projectControlller
                                        .projectList[1].ProjectName),
                                    value:
                                        _projectControlller.projectList[1].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(_projectControlller
                                        .projectList[2].ProjectName),
                                    value:
                                        _projectControlller.projectList[2].id,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(_projectControlller
                                        .projectList[3].ProjectName),
                                    value:
                                        _projectControlller.projectList[3].id,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextFormField(
                        minLines: 6,
                        maxLines: 10,
                        maxLength: 8,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Görüşme Özetini yazınız",
                            hintStyle: TextStyle(color: Colors.black45)),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: Colors.grey,
                        color: Colors.blueAccent,
                        child: Container(
                          child: Text(
                            "Kaydet",
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 25),
                        ),
                      )
                    ]))));
  }
}
