import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_getx/utils/controllers/user_controller.dart';

import '../controllers/todo_controller.dart';
import '../widgets/todo_card.dart';

class TodosScreen extends GetView<TodoController> {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int userId = Get.find<UserController>().userId!;
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text('Todos of User $userId'),
          ),
          body: controller.fetchingTodos
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: controller.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = controller.todos[index];
                      return TodoCard(
                        todo: todo,
                        onChanged: (value) {
                          controller.updateTodoStatus(todo.id, value);
                        },
                        onDelete: () {
                          controller.deleteTodoById(todo.id);
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
