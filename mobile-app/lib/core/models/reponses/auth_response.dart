import 'base_responses/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  AuthResponse(succes, {error, this.accessToken}) : super(succes, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) accessToken = json['body']['token'];
  }
}
