import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class FirebaseService {
  // ⚠️ We will replace YOUR_PROJECT_ID after Firebase setup
  static const String _baseUrl =
      'https://todo-app-077-default-rtdb.firebaseio.com';

  Future<List<TaskModel>> fetchTasks(String userId, String idToken) async {
    final url = Uri.parse('$_baseUrl/tasks/$userId.json?auth=$idToken');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data == null) return [];

      final List<TaskModel> tasks = [];
      (data as Map<String, dynamic>).forEach((key, value) {
        tasks.add(TaskModel.fromJson(Map<String, dynamic>.from(value)));
      });

      tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return tasks;
    } else {
      throw Exception('Failed to fetch tasks: ${response.body}');
    }
  }

  Future<void> addTask(TaskModel task, String idToken) async {
    final url =
        Uri.parse('$_baseUrl/tasks/${task.userId}/${task.id}.json?auth=$idToken');

    final response = await http.put(
      url,
      body: json.encode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add task: ${response.body}');
    }
  }

  Future<void> updateTask(TaskModel task, String idToken) async {
    final url =
        Uri.parse('$_baseUrl/tasks/${task.userId}/${task.id}.json?auth=$idToken');

    final response = await http.patch(
      url,
      body: json.encode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task: ${response.body}');
    }
  }

  Future<void> deleteTask(
      String taskId, String userId, String idToken) async {
    final url =
        Uri.parse('$_baseUrl/tasks/$userId/$taskId.json?auth=$idToken');

    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task: ${response.body}');
    }
  }

  Future<void> toggleTask(
      String taskId, String userId, bool isCompleted, String idToken) async {
    final url =
        Uri.parse('$_baseUrl/tasks/$userId/$taskId.json?auth=$idToken');

    final response = await http.patch(
      url,
      body: json.encode({'isCompleted': isCompleted}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to toggle task: ${response.body}');
    }
  }
}