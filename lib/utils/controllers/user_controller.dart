import 'package:get/get.dart';

class UserController extends GetxController {
  final _userId = Rxn<int>();

  int? get userId => _userId.value;

  void setUserId(int? id) {
    _userId.value = id;
  }
}
