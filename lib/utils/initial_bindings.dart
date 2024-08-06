import 'package:get/get.dart';
import 'package:my_app_getx/todos/controllers/todo_controller.dart';
import 'package:my_app_getx/utils/controllers/user_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<TodoController>(() => TodoController(), fenix: true);
  }

  static void init() {
    Get.put<InitialBindings>(InitialBindings());
  }
}
