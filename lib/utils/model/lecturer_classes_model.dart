class LecturerClassModel {
  String? classID;
  String? className;
  String? classDate;
  String? pDFLecturePath;
  String? sessionVoicePath;
  String? description;
  String? questionPartespation;
  String? isActive;
  String? image;
  String? qRCode;
  String? pIN;
  String? courseID;
  String? lecturerID;

  LecturerClassModel({
    this.classID,
    this.className,
    this.classDate,
    this.pDFLecturePath,
    this.sessionVoicePath,
    this.description,
    this.questionPartespation,
    this.isActive,
    this.image,
    this.qRCode,
    this.pIN,
    this.courseID,
    this.lecturerID,
    required courseModel,
  });

  LecturerClassModel.fromJson(Map<String, dynamic> json) {
    classID = json['ClassID'];
    className = json['ClassName'];
    classDate = json['ClassDate'];
    pDFLecturePath = json['PDFLecture_Path'];
    sessionVoicePath = json['SessionVoice_Path'];
    description = json['Description'];
    questionPartespation = json['QuestionPartespation'];
    isActive = json['IsActive'];
    image = json['Image'];
    qRCode = json['QRCode'];
    pIN = json['PIN'];
    courseID = json['CourseID'];
    lecturerID = json['LecturerID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClassID'] = this.classID;
    data['ClassName'] = this.className;
    data['ClassDate'] = this.classDate;
    data['PDFLecture_Path'] = this.pDFLecturePath;
    data['SessionVoice_Path'] = this.sessionVoicePath;
    data['Description'] = this.description;
    data['QuestionPartespation'] = this.questionPartespation;
    data['IsActive'] = this.isActive;
    data['Image'] = this.image;
    data['QRCode'] = this.qRCode;
    data['PIN'] = this.pIN;
    data['CourseID'] = this.courseID;
    data['LecturerID'] = this.lecturerID;
    return data;
  }
}
