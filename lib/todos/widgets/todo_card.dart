import 'package:flutter/material.dart';
import 'package:my_app_getx/todos/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final Function(bool value) onChanged;
  final Function() onDelete;
  const TodoCard({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: todo.completed ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: todo.completed,
            onChanged: (value) {
              onChanged(value!);
            },
          ),
          Expanded(
            child: Text(
              todo.title,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
