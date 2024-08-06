import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_getx/utils/app_routes.dart';
import 'package:my_app_getx/utils/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}
