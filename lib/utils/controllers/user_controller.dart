import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _userId = Rxn<int>();

  int? get userId => _userId.value;

  void setUserId(int? id) {
    _userId.value = id;
  }

  // ignore
  @override
  void onInit() {
    super.onInit();
    debugPrint('UserController Created');
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('UserController Closed');
  }
}
