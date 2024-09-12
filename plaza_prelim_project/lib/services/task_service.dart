import '../models/task.dart';

class TaskService {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title));
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  List<Task> getTasks() {
    return tasks;
  }
}
