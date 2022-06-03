class ProjectModel {
  final String ProjectName;
  final int id;

  ProjectModel({required this.ProjectName,required this.id});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        
        ProjectName: json['ProjectName'],
        id: json['Id']);
  }
}
