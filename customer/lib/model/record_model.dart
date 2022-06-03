import 'dart:convert';

import 'package:intl/intl.dart';

class RecordModel {
  final String Locations, ReportSummary;
  final int id, CustomerId, ProjectId;
  final DateTime RecordDate;
  final String RecordHour;
  RecordModel(
      {required this.Locations,
      required this.ReportSummary,
      required this.id,
      required this.CustomerId,
      required this.ProjectId,
      required this.RecordDate,
      required this.RecordHour});

  RecordModel recordModelFromJson(String str) =>
      RecordModel.fromJson(json.decode(str));

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
        Locations: json['Locations'],
        CustomerId: json['CustomerId'],
        RecordHour: json['RecordHour'],
        ProjectId: json['ProjectId'],
        RecordDate: json['RecordDate'],
        ReportSummary: json['ReportSummary'],
        id: json['Id']);
  }
}
