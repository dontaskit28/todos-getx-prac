import 'package:get/get.dart';
import 'package:my_app_getx/login/screens/login_screen.dart';
import 'package:my_app_getx/todos/controllers/todo_controller.dart';
import 'package:my_app_getx/todos/screens/todos_screen.dart';
import 'package:my_app_getx/utils/controllers/user_controller.dart';

class AppRoutes {
  static const login = '/';
  static const todos = '/todos';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => UserController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.todos,
      page: () => const TodosScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => UserController());
        Get.lazyPut(() => TodoController());
      }),
    ),
  ];
}
