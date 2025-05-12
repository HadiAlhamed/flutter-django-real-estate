import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate/services/api.dart';

class AuthApis {
  static Future<bool> signup({
    required String email,
    required String password,
  }) async {
    print("Email : $email \nPassword : $password");
    try {
      http.Response response = await http.post(
        Uri.parse("${Api.baseUrl}/users/signup/"),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        print("sign up succeed , check your email");
        return true;
      } else {
        print("sign up failed invaild input data or missing required fields");
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<int> checkActivationStatus({required String email}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("${Api.baseUrl}/users/check-activation-status/"),
        body: {
          'email': email,
        },
      );
      //-1 error
      //0 new email
      //1 exists not verified
      //2 verified
      if (response.statusCode == 200) {
        int ret = 0;
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['exists']) {
          ret = 1;
        }
        if (responseBody['is_activated']) {
          ret = 2;
        }
        return ret;
      } else {
        return -1;
      }
    } catch (e) {
      print("Network Error : $e");
      return -1;
    }
  }

  static Future<bool> verifyCode({
    required String email,
    required String code,
    required String purpose,
  }) async {
    print("Email : $email \nCode : $code");
    try {
      http.Response response = await http.post(
        Uri.parse("${Api.baseUrl}/users/verify-code/"),
        body: {
          'email': email,
          'code': code,
          'purpose': purpose,
        },
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(
            "Verification successful, the user is either activated or can now reset their password");
        return true;
      } else if (response.statusCode == 400) {
        print(
            "Invalid code, code expired, or blocked due to too many attempts");
      } else if (response.statusCode == 404) {
        print("User not found or no verification code available for the use");
      }

      return false;
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<bool> resendActivationCode({
    required String email,
  }) async {
    print("Email : $email");
    try {
      http.Response response = await http.post(
        Uri.parse("${Api.baseUrl}/users/forgot-password/"),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        print("email verification is resent");
        return true;
      } else {
        print("could not resend email verification");
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    
  }

  static Future<void> logout() async {}
}
