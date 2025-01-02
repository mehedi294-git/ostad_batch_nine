/*
A. Define an abstract named Role:
Declare a method void displayRole() to be implemented by classes that represent different roles (Student, Teacher).
*/
abstract class Role {
  void displayRole();
}

/*
B. Create a class Person:
Include attributes for name, age, and address.
Include a reference to the Role abstract class.
Provide a constructor and getter methods for the attributes.
Implement the Role abstract methods.
*/
 class Person {
  String name;
  int age;
  String address;
  Role role;

  // Constructor
  Person(this.name, this.age, this.address, this.role);

  // Getter methods
  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  // Implement Role abstract method
  void displayRole() {
    role.displayRole();
  }
}

/*
C. Create a class Student that extends Person:
Include additional attributes for studentID, grade, and a list to store courseScores.
Provide a constructor to initialize attributes.
Override the displayRole() method to display "Role: Student".
Implement a method to calculate the average score of courses.
*/
class Student extends Person {

  String studentID;
  double grade;
  List<double> courseScores;

  // Constructor
  Student(String name, int age, String address, Role role, this.studentID, this.grade, this.courseScores) : super(name, age, address, role);

  // Method to calculate the average score
  double fnCalculateAverageScore() {
    double vTotal = 0;
    for (var score in courseScores) {
      vTotal += score;
    }
    return vTotal / courseScores.length;
  }

  @override
  void displayRole() {
    print("Role: Student");
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

/*
D. Create another class Teacher that extends Person:
Include an attribute for teacherID and an array to store coursesTaught.
Provide a constructor to initialize attributes.
Override the displayRole() method to display "Role: Teacher".
Implement a method to display the courses taught by the teacher.
*/

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  // Constructor
  Teacher(String name, int age, String address, Role role, this.teacherID, this.coursesTaught)
      : super(name, age, address, role);

  // Method to display courses taught by the teacher
  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }

  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

/*
E. Create a class StudentManagementSystem:
In the main method, create instances of Student and Teacher classes.
Set the attributes using appropriate methods.
Use the displayRole() method to display the role of each person.
This extended scenario incorporates interfaces to provide role-based behavior for students and Teachers.
*/
void main() {
  // Create a Student
  List<double> studentScores = [90.0, 86.0, 91.0];

  Student student = Student(
      "John Doe",
      20,
      "123 Main St",
      StudentRole(),
      "S123",
      90.0,
      studentScores
  );

  // Display Student information
  print("Student Information:");
  student.displayRole();
  print("Name: ${student.getName}");
  print("Age: ${student.getAge}");
  print("Address: ${student.getAddress}");
  print("Average Score: ${student.fnCalculateAverageScore()}");


  // Create a Teacher
  List<String> teacherCourses = ["Math", "English", "Bangla"];
  Teacher teacher = Teacher(
      "Mrs. Smith",
      35,
      "456 Oak St",
      TeacherRole(),
      "T123",
      teacherCourses
  );

  // Display Teacher information
  print("Teacher Information:");
  teacher.displayRole();
  print("Name: ${teacher.getName}");
  print("Age: ${teacher.getAge}");
  print("Address: ${teacher.getAddress}");
  teacher.displayCoursesTaught();
}

