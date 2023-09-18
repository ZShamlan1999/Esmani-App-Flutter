class CourseModel {
  final int courseID;
  final String courseName;
  final String courseLevel;
  final String departemnt;
  final String period;
  final String courseHour;
  final String courseDate;
  final String? image;
  final int isLocked;
  final String qRcode;
  final String pin;
  final int lecturerID;

  CourseModel(
      {required this.courseID,
      required this.courseName,
      required this.courseLevel,
      required this.departemnt,
      required this.period,
      required this.courseHour,
      required this.courseDate,
      required this.image,
      required this.isLocked,
      required this.qRcode,
      required this.pin,
      required this.lecturerID});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseID: json['CourseID'],
      courseName: json['CourseName'],
      courseLevel: json['CourseLevel'],
      departemnt: json['Departemnt'],
      period: json['Period'],
      courseHour: json['CourseHour'],
      courseDate: json['CourseDate'],
      image: json['Image'],
      isLocked: json['IsLocked'],
      qRcode: json['QRcode'],
      pin: json['PIN'],
      lecturerID: json['LecturerID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['CourseName'] = this.courseName;
    data['CourseLevel'] = this.courseLevel;
    data['Departemnt'] = this.departemnt;
    data['Period'] = this.period;
    data['CourseHour'] = this.courseHour;
    data['CourseDate'] = this.courseDate;
//    data['Image'] = this.image;
    data['IsLocked'] = this.isLocked;
    data['QRcode'] = this.qRcode;
    data['PIN'] = this.pin;
    data['LecturerID'] = this.lecturerID;
    return data;
  }
}
