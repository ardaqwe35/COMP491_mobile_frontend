import 'package:comp491_mobile_frontend/services/user.dart';

class UsersResponse {
  final List<User> users;

  UsersResponse({
    required this.users,
  });

  factory UsersResponse.fromMap(Map<String, dynamic> map) {
    return UsersResponse(
      users: List<User>.from(map["users"].map((x) => User.fromMap(x))),
    );
  }

  factory UsersResponse.empty() {
    return UsersResponse(
      users: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() => 'UsersResponse(users: $users)';
}
