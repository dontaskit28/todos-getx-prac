import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_getx/todos/models/todo_model.dart';
import 'package:my_app_getx/utils/controllers/user_controller.dart';
import 'package:my_app_getx/utils/services/http_service.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  int userId = Get.find<UserController>().userId!;
  final _todos = <TodoModel>[].obs;
  final _fetchingTodos = true.obs;

  List<TodoModel> get todos => _todos;
  bool get fetchingTodos => _fetchingTodos.value;

  void setTodos(List<TodoModel> todos) {
    _todos.value = todos;
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('TodoController Created');
    fetchTodos(userId: userId);
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('TodoController Closed');
  }

  void fetchTodos({
    required int userId,
  }) async {
    _fetchingTodos.value = true;
    try {
      http.Response? response = await HttpService.get('/todos');
      if (response == null || response.statusCode != 200) return;
      List<TodoModel> todos = [];
      List<dynamic> todosList = jsonDecode(response.body);
      for (var todo in todosList) {
        todos.add(TodoModel.fromJson(todo));
      }
      List<TodoModel> filteredTodos = filterByUserId(userId, todos);
      setTodos(filteredTodos);
      sortByName();
    } catch (e) {
      rethrow;
    } finally {
      _fetchingTodos.value = false;
    }
  }

  List<TodoModel> filterByUserId(int userId, List<TodoModel> todos) {
    return todos.where((todo) => todo.userId == userId).toList();
  }

  void sortByName() {
    _todos.sort((a, b) => a.title.compareTo(b.title));
  }

  void updateTodoStatus(int id, bool status) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index == -1) return;
    _todos[index] = _todos[index].copyWith(completed: status);
  }

  void deleteTodoById(int id) {
    _todos.removeWhere((todo) => todo.id == id);
  }
}
