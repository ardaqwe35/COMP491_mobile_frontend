import 'package:comp491_mobile_frontend/services/user.dart';

class UsersResponse {
  final User user;

  UsersResponse({
    required this.user,
  });

  factory UsersResponse.fromMap(Map<String, dynamic> map) {
    return UsersResponse(
      user: User.fromMap(map),
    );
  }

  factory UsersResponse.empty() {
    return UsersResponse(
      user: User.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
    };
  }

  @override
  String toString() => 'UsersResponse(uses: $user)';
}
