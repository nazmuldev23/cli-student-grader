import 'dart:io';

void main() {
  const String appTitle = "===== Student Grader v1.0 ====="; // const
  print("$appTitle");//string interpolation

  //set (unique subjects)
  final Set<String> availableSubjects = {"Math", "English", "Science"};//final

   // List of students (each student is a Map)
  List<Map<String, dynamic>> students = [];

  bool running = true;


  // do-while loop (Main menu loop)
  do {
    //multi-line String
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
        recordScore(students, availableSubjects);
        break;

      case "3":
        addBonus(students);
        break;

      case "4":
        addComment(students);
        break;
      case "5":
        viewAllStudents(students);
        break;

      case "6":
        reportCard(students);
        break;

      case "7":
        classSummary(students);
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

  // Spread operator (copying subjects into new list)
  List<String> subjectList = [...subjects];

  Map<String, int> scores = {};

  //for in loop
  for (var subject in subjectList) {  //var
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

  // ??= null-aware access
  bonus ??= 0;

  stdout.write("Enter comment (optional): ");
  String? comment = stdin.readLineSync(); // String?(nullable)

  // Map for student record
  Map<String, dynamic> student = {
    "name": name,
    "scores": scores,
    "bonus": bonus,
    "comment": comment,
  };

  students.add(student);

  print("Student Added Successfully!\n");
}

//view All Students
void viewAllStudents(List<Map<String, dynamic>> students) {
  print("\n--- View All Students ---");

  if (students.isEmpty) {
    print("No students found!\n");
    return;
  }
// indexed for loop
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  print("");
}
// ---------------- RECORD SCORE ----------------
void recordScore(List<Map<String, dynamic>> students, Set<String> subjects) {
  print("\n--- Record Score ---");

  if (students.isEmpty) {
    print("No students available!\n");
    return;
  }

  viewAllStudents(students);

  stdout.write("Select student number: ");
  int index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

  if (index < 1 || index > students.length) {
    print("Invalid student number!\n");
    return;
  }

  Map<String, dynamic> student = students[index - 1];
  Map<String, int> scores = student["scores"];

  for (String subject in subjects) {
    stdout.write("Enter score for $subject (0-100): ");
    int score = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

    while (score < 0 || score > 100) {
      print("Invalid score! Must be 0-100.");
      stdout.write("Enter score for $subject again: ");
      score = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
    }

    scores[subject] = score;
  }

  print("Scores recorded successfully!\n");
}
// ---------------- ADD BONUS ----------------
void addBonus(List<Map<String, dynamic>> students) {
  print("\n--- Add Bonus Points ---");

  if (students.isEmpty) {
    print("No students available!\n");
    return;
  }

  viewAllStudents(students);

  stdout.write("Select student number: ");
  int index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

  if (index < 1 || index > students.length) {
    print("Invalid student number!\n");
    return;
  }

  stdout.write("Enter bonus points: ");
  int bonus = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  students[index - 1]["bonus"] = bonus;

  print("Bonus added successfully!\n");
}
// ---------------- ADD COMMENT ----------------
void addComment(List<Map<String, dynamic>> students) {
  print("\n--- Add Comment ---");

  if (students.isEmpty) {
    print("No students available!\n");
    return;
  }

  viewAllStudents(students);

  stdout.write("Select student number: ");
  int index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

  if (index < 1 || index > students.length) {
    print("Invalid student number!\n");
    return;
  }

  stdout.write("Enter comment: ");
  String comment = stdin.readLineSync() ?? "";

  students[index - 1]["comment"] = comment;

  print("Comment added successfully!\n");
}
// ---------------- VIEW REPORT CARD ----------------
void reportCard(List<Map<String, dynamic>> students) {
  print("\n--- Student Report Card ---");

  if (students.isEmpty) {
    print("No students available!\n");
    return;
  }

  stdout.write("Enter student number (1-${students.length}): ");
  int index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

  if (index < 1 || index > students.length) {
    print("Invalid student number!\n");
    return;
  }

  Map<String, dynamic> student = students[index - 1];

  String name = student["name"];
  Map<String, int> scores = student["scores"];
  int bonus = student["bonus"];

  if (scores.isEmpty) {
    print("No scores recorded yet for $name!\n");
    return;
  }

// arithmetic operators (average calculation)
  int total = 0;
  scores.forEach((key, value) {
    total += value;
  });

  double average = (total / scores.length) + bonus;
// relational operators + logical operators
  String grade;
  if (average >= 80 && average <= 100) {
    grade = "A+";
  } else if (average >= 70 && average < 80) {
    grade = "A";
  } else if (average >= 60 && average < 70) {
    grade = "A-";
  } else if (average >= 50 && average < 60) {
    grade = "B";
  } else if (average >= 40 && average < 50) {
    grade = "C";
  } else {
    grade = "F";
  }

  // null-aware access ?.
  String commentDisplay = student["comment"]?.toString() ?? "No comment";

  print("""
===================================
           Report Card
===================================
Name: $name
Scores: $scores
Bonus: $bonus
Average: ${average.toStringAsFixed(2)}
Grade: $grade
Comment: $commentDisplay
===================================
""");
}
// ---------------- CLASS SUMMARY ----------------
void classSummary(List<Map<String, dynamic>> students) {
  print("\n--- Class Summary ---");

  if (students.isEmpty) {
    print("No students available!\n");
    return;
  }

  double totalAverage = 0;
  int count = 0;


  List<String> summaryLines = [
    for (var student in students) // collection for
      if ((student["scores"] as Map<String, int>).isNotEmpty) // collection if
        "${student["name"]} has scores recorded"
      else
        "${student["name"]} has no scores yet"
  ];

  for (var student in students) {
    Map<String, int> scores = student["scores"];
    int bonus = student["bonus"];

    if (scores.isEmpty) continue;

    int total = 0;
    scores.forEach((k, v) => total += v);

    double avg = (total / scores.length) + bonus;

    totalAverage += avg;
    count++;
  }

  if (count == 0) {
    print("No student scores recorded yet!\n");
    return;
  }

  double classAvg = totalAverage / count;

  print("Total Students: ${students.length}");
  print("Students With Scores: $count");
  print("Class Average: ${classAvg.toStringAsFixed(2)}\n");

  print("Summary Notes:");
  for (String line in summaryLines) {
    print("- $line");
  }

  print("");
}