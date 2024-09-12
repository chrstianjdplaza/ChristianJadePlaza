import 'package:riverpod/riverpod.dart';
import 'models/task.dart';
import 'services/task_service.dart';
import 'dart:io'; // For handling user input/output

// Riverpod provider for the TaskService
final taskServiceProvider = Provider((ref) => TaskService());

void main() {
  final container = ProviderContainer();
  final taskService = container.read(taskServiceProvider);

  print("Welcome to the Name List App!");

  while (true) {
    print("\nChoose an option:");
    print("1. Add Name");
    print("2. View Name");
    print("3. Delete Name");
    print("4. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add Name
        print("Enter the name:");
        String? name = stdin.readLineSync();
        if (name != null && name.isNotEmpty) {
          taskService.addTask(name);
          print("Name added!");
        } else {
          print("Invalid name.");
        }
        break;

      case '2':
        // View Names
        List<Task> names = taskService.getTasks();
        if (names.isEmpty) {
          print("No names available.");
        } else {
          print("\nYour names:");
          for (int i = 0; i < names.length; i++) {
            print("${i + 1}. ${names[i].title}");
          }
        }
        break;

      case '3':
        // Delete Name
        print("Enter the number of the name to delete:");
        String? nameNumber = stdin.readLineSync();
        if (nameNumber != null && int.tryParse(nameNumber) != null) {
          int nameIndex = int.parse(nameNumber) - 1;
          if (nameIndex >= 0 && nameIndex < taskService.getTasks().length) {
            taskService.deleteTask(nameIndex);
            print("Name deleted!");
          } else {
            print("Invalid name number.");
          }
        } else {
          print("Please enter a valid number.");
        }
        break;

      case '4':
        // Exit
        print("Goodbye!");
        exit(0);

      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}
