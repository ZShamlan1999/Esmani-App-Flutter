class StudentCoursesModel {
  String? fullName;
  String? courseName;

  String? image;

  StudentCoursesModel({this.fullName, this.courseName, this.image});

  StudentCoursesModel.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    courseName = json['CourseName'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    data['CourseName'] = this.courseName;
    data['Image'] = this.image;
    return data;
  }
}
