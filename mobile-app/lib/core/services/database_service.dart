import 'package:quizzes_mobile_app/core/services/api_services.dart';

import '../constants/api_end_pionts.dart';
import '../models/body/login_body.dart';
import '../models/body/reset_password_body.dart';
import '../models/body/signup_body.dart';
import '../models/reponses/auth_response.dart';
import '../models/reponses/base_responses/base_response.dart';
import '../models/reponses/base_responses/request_response.dart';
import '../models/reponses/onboarding_reponse.dart';
import '../models/reponses/user_profile_response.dart';

class DatabaseService {
  final ApiServices _apiServices = ApiServices();

  Future<UserProfileResponse> getUserProfile() async {
    final RequestResponse response = await _apiServices.get(
        url: '${EndPoints.baseUrl}${EndPoints.userProfile}');
    return UserProfileResponse.fromJson(response.data);
  }

  Future<OnboardingResponse> getOnboardingData() async {
    final RequestResponse response = await _apiServices.get(
        url: '${EndPoints.baseUrl}${EndPoints.onboardingData}');
    return OnboardingResponse.fromJson(response.data);
  }

  Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.fcm_token}',
      data: {
        'device_id': deviceId,
        'token': token,
      },
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> clearFcmToken(String deviceId) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.clear_fcm_token}',
      data: {'device_id': deviceId},
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.login}',
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> createAccount(SignUpBody body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.signup}',
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> resetPassword(ResetPasswordBody body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.reset_password}',
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }
}
