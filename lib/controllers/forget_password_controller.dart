import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  bool emailEntered = false;
  bool codeVerified = false;
  String email = '';
  String code = '';
  void changeEmailFlag(bool value) {
    emailEntered = value;
    update(['main']);
  }

  void changeCodeFlag(bool value) {
    codeVerified = value;
    update(['image', 'main']);
  }

  set emailValue(String e) => email = e;

  set codeValue(String c) => code = c;

  void clear() {
    email = '';
    code = '';
    emailEntered = false;
    codeVerified = false;
  }
}
