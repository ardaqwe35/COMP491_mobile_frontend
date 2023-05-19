import 'package:comp491_mobile_frontend/services/post.dart';

class User {
  final String id;
  final String ppUrl;
  final String bannerUrl;
  final String name;
  final int gildCount;
  final int followerCount;
  final List<Post> previousPosts;
  final List<User> followers;

  User({
    required this.id,
    required this.ppUrl,
    required this.bannerUrl,
    required this.name,
    required this.gildCount,
    required this.followerCount,
    required this.previousPosts,
    required this.followers,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      ppUrl: map['ppUrl'],
      bannerUrl: map['bannerUrl'],
      name: map['name'],
      gildCount: map['gildCount'],
      followerCount: map['followerCount'],
      previousPosts:
          List<Post>.from(map['previousPosts'].map((x) => Post.fromMap(x))),
      followers: List<User>.from(map['followers'].map((x) => User.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ppUrl': ppUrl,
      'bannerUrl': bannerUrl,
      'name': name,
      'gildCount': gildCount,
      'followerCount': followerCount,
      'previousPosts': previousPosts.map((x) => x.toMap()).toList(),
      'followers': followers.map((x) => x.toMap()).toList(),
    };
  }

  factory User.empty() {
    return User(
        id: "",
        ppUrl: "",
        bannerUrl: "",
        name: "",
        gildCount: 0,
        followerCount: 0,
        previousPosts: [],
        followers: []);
  }

  @override
  String toString() {
    return 'User(id: $id, ppUrl: $ppUrl, bannerUrl: $bannerUrl, name: $name, gildCount: $gildCount, followerCount: $followerCount, previousPosts: $previousPosts, followers: $followers)';
  }
}
