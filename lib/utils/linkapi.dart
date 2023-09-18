const String linkServerName = "http://192.168.17.254/esm_php";
// const String linkImageRoot = "http://10.0.2.2/esm_php/upload";

//192.168.17.254
//10.0.2.2
//192.168.42.241
//192.168.43.224
//192.168.42.232

//Auth
const String linkSignUp = "$linkServerName/auth/signup.php";
const String linkLogin = "$linkServerName/auth/login_lecturer.php";
const String linkLoginStudent = "$linkServerName/auth/login_student.php";

//Course
const String linkAddCourse = "$linkServerName/course/addcourse.php";
const String linkViewCourse = "$linkServerName/course/viewcourse.php";
const String linkEditCourse = "$linkServerName/course/editcourse.php";
const String linkStatusCourse = "$linkServerName/course/opencourse.php";
const String linkCountStudentsInCourse =
    "$linkServerName/course/count_student_in_course.php";

//Class
const String linkViewClass = "$linkServerName/class/viewclass.php";
const String linkAddClass = "$linkServerName/class/addclass.php";
const String linkEditClass = "$linkServerName/class/editclass.php";

//Student
const String linkEditStudent = "$linkServerName/student/edit_student.php";
const String linkViewCourseOfStudent =
    "$linkServerName/student/view_course_of_student.php";
const String linkViewClassOfStudent =
    "$linkServerName/student/view_class_of_student.php";
const String linkJoinToCourseforStudent =
    "$linkServerName/student/joincourse.php";

const String linkEditLecturer = "$linkServerName/lecturer/edit_lecturer.php";
