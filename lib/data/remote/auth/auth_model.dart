import 'package:graphql_flutter/graphql_flutter.dart';

class AuthModel {
  final QueryResult result;

  AuthModel(this.result);

  String parseCreateOtp() {
    return result.data!["createOtp"]["satusCode"];
  }

  VerifyResponse parseVerifyOtp() {
    var data = result.data!["verifyOtp"]["result"];
    return VerifyResponse(
        data["token"], data["refreshToken"], data["expiresAt"]);
  }
}

class VerifyResponse {
  final String token;
  final String refreshToken;
  final String expiresAt;

  VerifyResponse(this.token, this.refreshToken, this.expiresAt);
}
