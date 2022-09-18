import 'package:graphql_flutter/graphql_flutter.dart';

class Profile {
  final String name;
  final String mobileNumber;
  final String email;
  final String profileImageUrl;

  Profile(this.name, this.mobileNumber, this.email, this.profileImageUrl);

  Profile._(
      {required this.name,
      required this.mobileNumber,
      required this.email,
      required this.profileImageUrl});

  factory Profile.parse(final QueryResult result) {
    final profile = result.data!["getCustomerProfile"]["result"];

    return Profile._(
        name: profile["name"],
        mobileNumber: "${profile["countryCode"]}${profile["phone"]}",
        email: profile["primaryEmail"],
        profileImageUrl: profile["avatar"] ?? "");
  }
}
