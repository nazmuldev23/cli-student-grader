import 'dart:io';

void main() {
  const String appTitle = "===== Student Grader v1.0 ====="; // const
  print("$appTitle");

  //set (unique subjects)
  final Set<String> availableSubjects = {"Math", "English", "Science"};//final

   // List of students (each student is a Map)
  List<Map<String, dynamic>> students = [];

  bool running = true;


  // do-while loop (Main menu loop)
  do {
    print("""
    
1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
""");

    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? "";

    //switch case
    switch (choice) {
      case "1":
        addStudent(students,availableSubjects);
        break;

      case "2":
        print("Record Score feature coming soon...");
        break;

      case "3":
        print("Add Bonus Points feature coming soon...");
        break;

      case "4":
        print("Add Comment feature coming soon...");
        break;
      case "5":
        print("View All Students feature coming soon...");
        break;

      case "6":
        print("View Report Card feature coming soon...");
        break;

      case "7":
        print("Class Summary feature coming soon...");
        break;

      case "8":
        print("Exiting... Goodbye!");
        running = false;
        break;

      default:
        print("Invalid choice! Try again.");
    }
  } while (running);
}

//Add Student
void addStudent(List<Map<String, dynamic>> students,Set<String> subjects) {
  print("\n--- Add Student ---");

  stdout.write("Enter student name: ");
  String name = stdin.readLineSync() ?? "";

  //while loop(input validation)
  while (name.trim().isEmpty) {
    print("Name cannot be empty!");
    stdout.write("Enter student name again: ");
    name = stdin.readLineSync() ?? "";
  }

  Map<String, int> scores = {};

  //for in loop
  for (String subject in subjects) {
    stdout.write("Enter $subject score: ");
    int score = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
    scores[subject] = score;
  }
  stdout.write("Enter bonus marks (optional): ");
  String bonusInput = stdin.readLineSync() ?? "";
  //int?(nullable)
  int? bonus;

  if (bonusInput.trim().isNotEmpty) {
    bonus = int.tryParse(bonusInput);
  }

  // ??= null-aware assign
  bonus ??= 0;

  stdout.write("Enter comment (optional): ");
  String? comment = stdin.readLineSync(); // String?

  Map<String, dynamic> student = {
    "name": name,
    "scores": scores,
    "bonus": bonus,
    "comment": comment,
  };


  students.add(student);

  print("Student Added Successfully!\n");
}