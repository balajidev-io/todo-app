import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/task_model.dart';
import '../services/firebase_service.dart';

enum TaskStatus { initial, loading, loaded, error }

class TaskProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  final Uuid _uuid = const Uuid();

  List<TaskModel> _tasks = [];
  TaskStatus _status = TaskStatus.initial;
  String? _errorMessage;

  List<TaskModel> get tasks => _tasks;
  TaskStatus get status => _status;
  String? get errorMessage => _errorMessage;

  List<TaskModel> get completedTasks =>
      _tasks.where((t) => t.isCompleted).toList();
  List<TaskModel> get pendingTasks =>
      _tasks.where((t) => !t.isCompleted).toList();

  Future<void> fetchTasks(String userId, String idToken) async {
    try {
      _status = TaskStatus.loading;
      _errorMessage = null;
      notifyListeners();

      _tasks = await _firebaseService.fetchTasks(userId, idToken);
      _status = TaskStatus.loaded;
      notifyListeners();
    } catch (e) {
      _status = TaskStatus.error;
      _errorMessage = 'Failed to load tasks. Please try again.';
      notifyListeners();
    }
  }

  Future<bool> addTask({
    required String title,
    required String description,
    required String userId,
    required String idToken,
  }) async {
    try {
      final task = TaskModel(
        id: _uuid.v4(),
        title: title,
        description: description,
        isCompleted: false,
        createdAt: DateTime.now(),
        userId: userId,
      );

      _tasks.insert(0, task);
      notifyListeners();

      await _firebaseService.addTask(task, idToken);
      return true;
    } catch (e) {
      _errorMessage = 'Failed to add task. Please try again.';
      notifyListeners();
      return false;
    }
  }

  Future<bool> editTask({
    required String taskId,
    required String title,
    required String description,
    required String userId,
    required String idToken,
  }) async {
    try {
      final index = _tasks.indexWhere((t) => t.id == taskId);
      if (index == -1) return false;

      final updatedTask = _tasks[index].copyWith(
        title: title,
        description: description,
      );

      _tasks[index] = updatedTask;
      notifyListeners();

      await _firebaseService.updateTask(updatedTask, idToken);
      return true;
    } catch (e) {
      _errorMessage = 'Failed to update task. Please try again.';
      notifyListeners();
      return false;
    }
  }

  Future<void> toggleTask(
      String taskId, String userId, String idToken) async {
    try {
      final index = _tasks.indexWhere((t) => t.id == taskId);
      if (index == -1) return;

      final newValue = !_tasks[index].isCompleted;

      _tasks[index] = _tasks[index].copyWith(isCompleted: newValue);
      notifyListeners();

      await _firebaseService.toggleTask(taskId, userId, newValue, idToken);
    } catch (e) {
      _errorMessage = 'Failed to update task status.';
      notifyListeners();
    }
  }

  Future<bool> deleteTask(
      String taskId, String userId, String idToken) async {
    try {
      final index = _tasks.indexWhere((t) => t.id == taskId);
      if (index == -1) return false;

      _tasks.removeAt(index);
      notifyListeners();

      await _firebaseService.deleteTask(taskId, userId, idToken);
      return true;
    } catch (e) {
      _errorMessage = 'Failed to delete task. Please try again.';
      notifyListeners();
      return false;
    }
  }

  void clearTasks() {
    _tasks = [];
    _status = TaskStatus.initial;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}