import 'package:food_app/data/remote/auth/auth_data_source.dart';
import 'package:food_app/data/remote/auth/auth_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/graphql.dart';
import '../../../graphql/query/create_otp_queary.dart';
import '../../../graphql/query/verify_otp.dart';

class AuthDataSourceImp implements AuthDataSource {
  BaseDataSource client = BaseDataSource();

  @override
  Future<bool> createOtp(String phoneNumber) async {
    QueryResult result = await BaseDataSource.client.value.query(
        QueryOptions(document: gql(CreateOtpQuery().createOtp), variables: {
      "phoneNo": phoneNumber,
      "countryCode": "880",
      "deviceUuid": "string",
      "device": const {}
    }));
    var x = AuthModel(result);
    return x.parseCreateOtp() == "200";
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    // TODO: implement getPrettyJsonString
    throw UnimplementedError();
  }

  @override
  Future<VerifyResponse> verifyOtp(String phoneNumber, String OTP) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(VerifyOTP().verifyOTP),
        variables: {
          "phoneNo": phoneNumber,
          "countryCode": "880",
          "deviceUuid": "string",
          "otp": OTP
        }));
    var x = AuthModel(result);
    return x.parseVerifyOtp();
  }
}
