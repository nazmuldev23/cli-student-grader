void main() {
  print("=========== MODULE 2 ASSIGNMENT ===========\n");

  // ===========================
  // Step 2: Practicing Lists
  // ===========================
  print("----- Step 2: Practicing Lists -----\n");

  // Growable List
  List<int> numbers = [10, 5, 20, 15];
  print("Growable List: $numbers");

  // add()
  numbers.add(25);
  print("After add(25): $numbers");

  // remove()
  numbers.remove(10);
  print("After remove(10): $numbers");

  // insert()
  numbers.insert(1, 99);
  print("After insert(1, 99): $numbers");

  // sorting numeric list
  numbers.sort();
  print("After sorting: $numbers");

  print("\n-------------------------------\n");

  // Fixed-length List
  List<String> fixedList = List.filled(4, "Empty");
  print("Fixed-length List: $fixedList");

  fixedList[0] = "Math";
  fixedList[1] = "English";
  fixedList[2] = "Science";
  fixedList[3] = "ICT";

  print("After updating fixed list: $fixedList");

  print("\n====================================\n");

  // ===========================
  // Step 3: Practicing Sets
  // ===========================
  print("----- Step 3: Practicing Sets -----\n");

  Set<String> fruits = {"Apple", "Banana", "Mango", "Apple"};
  print("Set (duplicate auto removed): $fruits");

  // add()
  fruits.add("Orange");
  print("After add('Orange'): $fruits");

  // remove()
  fruits.remove("Banana");
  print("After remove('Banana'): $fruits");

  // Union, Intersection, Difference
  Set<String> setA = {"A", "B", "C", "D"};
  Set<String> setB = {"C", "D", "E", "F"};

  print("\nSet A: $setA");
  print("Set B: $setB");

  print("Union (A ∪ B): ${setA.union(setB)}");
  print("Intersection (A ∩ B): ${setA.intersection(setB)}");
  print("Difference (A - B): ${setA.difference(setB)}");

  print("\n====================================\n");

  // ===========================
  // Step 4: Practicing Maps
  // ===========================
  print("----- Step 4: Practicing Maps -----\n");

  Map<int, String> studentNames = {
    101: "Rahim",
    102: "Karim",
    103: "Sakib",
  };

  print("Student Names Map: $studentNames");
  print("Student with ID 102: ${studentNames[102]}");

  Map<String, int> studentAge = {
    "Rahim": 18,
    "Karim": 19,
    "Sakib": 17,
  };

  print("Student Age Map: $studentAge");
  print("Age of Karim: ${studentAge["Karim"]}");

  print("\n====================================\n");

  // ===========================
  // Step 5: Working with Nested Maps
  // ===========================
  print("----- Step 5: Nested Maps -----\n");

  Map<int, Map<String, dynamic>> studentsData = {
    1: {"name": "Rahim", "grade": "A+", "age": 18},
    2: {"name": "Karim", "grade": "A", "age": 19},
    3: {"name": "Sakib", "grade": "B+", "age": 17},
  };

  print("Nested Student Map: $studentsData");

  print("\nStudent Roll 2 Info: ${studentsData[2]}");
  print("Student Roll 2 Name: ${studentsData[2]?["name"]}");
  print("Student Roll 2 Grade: ${studentsData[2]?["grade"]}");

  print("\n====================================\n");

  // ===========================
  // Step 6: Map methods keys & values
  // ===========================
  print("----- Step 6: Map Methods -----\n");

  print("All keys: ${studentsData.keys}");
  print("All values: ${studentsData.values}");

  print("\n====================================\n");

  // ===========================
  // Step 7 & 8: Student Info System (Mini Project)
  // ===========================
  print("----- Step 7 & 8: Student Info System -----\n");

  // List of Maps (Each student is a Map)
  List<Map<String, dynamic>> studentList = [
    {"name": "Rahim", "roll": 1, "grade": "A+"},
    {"name": "Karim", "roll": 2, "grade": "A"},
    {"name": "Sakib", "roll": 3, "grade": "B+"},
  ];

  // Display all students
  print("Student List (Before Adding New Student):\n");
  displayStudents(studentList);

  // Add new student
  Map<String, dynamic> newStudent = {"name": "Nazmul", "roll": 4, "grade": "A+"};
  studentList.add(newStudent);

  print("\nNew student added successfully!\n");

  // Display again after adding
  print("Student List (After Adding New Student):\n");
  displayStudents(studentList);

  print("\n====================================\n");

  // ===========================
  // Step 9: Testing Done
  // ===========================
  print("----- Step 9: Testing -----\n");
  print("All steps executed successfully. Check output for correctness.\n");

  print("\n====================================\n");

  // ===========================
  // Step 11: Code cleanup and comments
  // ===========================
  print("----- Step 11: Code Cleanup Done -----\n");
  print("Code formatted, comments added, unnecessary lines removed.\n");

  print("=========== ASSIGNMENT COMPLETE ===========");
}

// Function to display students neatly
void displayStudents(List<Map<String, dynamic>> studentList) {
  for (var student in studentList) {
    print("Name: ${student["name"]} | Roll: ${student["roll"]} | Grade: ${student["grade"]}");
  }
}