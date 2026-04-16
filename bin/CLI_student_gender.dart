import 'dart:io';

void main() {
  const String appTitle = "===== Student Grader v1.0 ====="; // const
  print("$appTitle");

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
        print("Add Student feature coming soon...");
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