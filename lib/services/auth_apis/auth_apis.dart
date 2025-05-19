import 'package:dio/dio.dart';
import 'package:real_estate/services/api.dart';
import 'package:real_estate/services/auth_services/auth_interceptor.dart';
import 'package:real_estate/services/auth_services/token_service.dart';

class AuthApis {
  static final Dio _dio = Dio();
  static Future<void> init() async {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  static Future<bool> signup({
    required String email,
    required String password,
  }) async {
    print("Email : $email \nPassword : $password");
    try {
      final response = await _dio.post(
        "${Api.baseUrl}/users/signup/",
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        print("sign up succeed , check your email");
        return true;
      } else {
        print("sign up failed invalid input data or missing required fields");
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<int> checkActivationStatus({required String email}) async {
    try {
      final response = await _dio.post(
        "${Api.baseUrl}/users/check-activation-status/",
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        int ret = 0;
        final responseBody = response.data;
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
      final response = await _dio.post(
        "${Api.baseUrl}/users/verify-code/",
        data: {
          'email': email,
          'code': code,
          'purpose': purpose,
        },
      );

      print(response.data);

      if (response.statusCode == 200) {
        print(
            "Verification successful, the user is either activated or can now reset their password");
        return true;
      } else if (response.statusCode == 400) {
        print(
            "Invalid code, code expired, or blocked due to too many attempts");
      } else if (response.statusCode == 404) {
        print("User not found or no verification code available for the user");
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
      final response = await _dio.post(
        "${Api.baseUrl}/users/forgot-password/",
        data: {
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

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    // TODO: Add login implementation using Dio
    print("Trying to login");
    print("Email : $email \nPassword : $password");
    try {
      final response = await _dio.post(
        "${Api.baseUrl}/users/login/",
        data: {
          'email': email,
          'password': password,
        },
      );
      print("got a resonse");
      if (response.statusCode == 200) {
        final data = response.data;
        await TokenService.saveTokens(
          accessToken: data['access'],
          refreshToken: data['refresh'],
        );
        print("Login succeed");
        return true;
      } else {
        print("Login unauthorized");
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<bool> refreshToken() async {
    final refreshToken = await TokenService.getRefreshToken();

    try {
      final response = await _dio.post(
        '${Api.baseUrl}/auth/jwt/refresh/',
        data: {'refresh': refreshToken},
      );

      if (response.statusCode == 201) {
        print("tokens refreshed successfully");
        final data = response.data;
        await TokenService.saveTokens(
          accessToken: data['access'],
          refreshToken: data['refresh'],
        );
        return true;
      } else {
        print("tokens failed to refresh !!!");
        return false;
      }
    } catch (e) {
      await TokenService.clearTokens();
      return false;
    }
  }

  static Future<bool> logout() async {
    // TODO: Add logout implementation if needed
    try {
      final response = await _dio.post(
        '${Api.baseUrl}/users/logout/',
      );
      if (response.statusCode == 200) {
        print("logged out successfully");
        await TokenService.clearTokens();
        return true;
      } else {
        print("logged out failed!!!");
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }

  static Future<bool> changeIsSeller(bool isSeller) async {
    try {
      final response =
          await _dio.patch('${Api.baseUrl}/users/profile/is-seller/', data: {
        'is_seller': isSeller,
      });
      if (response.statusCode == 200) {
        print("is Seller toggelled successfully");
        return true;
      } else {
        print("is Seller couldn't be toggelled");
        print(response.statusMessage);
        return false;
      }
    } catch (e) {
      print("Network Error : $e");
      return false;
    }
  }
}
