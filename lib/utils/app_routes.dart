import 'package:get/get.dart';
import 'package:my_app_getx/home/screens/home_screen.dart';
import 'package:my_app_getx/todos/screens/todos_screen.dart';

class AppRoutes {
  static const home = '/';
  static const todos = '/todos';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.todos,
      page: () => const TodosScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
