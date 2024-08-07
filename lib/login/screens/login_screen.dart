import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app_getx/utils/app_routes.dart';
import 'package:my_app_getx/utils/controllers/user_controller.dart';
import 'package:my_app_getx/utils/snackbar.dart';

class LoginScreen extends GetView<UserController> {
  const LoginScreen({super.key});

  onButtonPressed() {
    if (controller.userId == null) {
      CustomSnackbar.showSnackbar(
        message: "User ID cannot be empty",
        title: "Invalid User ID ",
      );
      return;
    }
    if (controller.userId! < 1 || controller.userId! > 10) {
      CustomSnackbar.showSnackbar(
        message: "User ID must be between 1 and 10",
        title: "Invalid User ID",
      );
      return;
    }
    Get.toNamed(AppRoutes.todos);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: controller.userId == null
                      ? ''
                      : controller.userId?.toString(),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.setUserId(null);
                      return;
                    }
                    controller.setUserId(int.parse(value));
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  onTapOutside: (focusNode) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter User ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: onButtonPressed,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
