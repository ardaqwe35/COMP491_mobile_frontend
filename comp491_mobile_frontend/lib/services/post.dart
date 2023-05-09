class Post {
  final String userId;
  final int time;
  final String text;
  final String imageUrl;
  final int totalGilds;
  final int totalLikes;

  Post({
    required this.userId,
    required this.time,
    required this.text,
    required this.imageUrl,
    required this.totalGilds,
    required this.totalLikes,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      time: map['time'],
      text: map['text'],
      imageUrl: map['imageUrl'],
      totalGilds: map['totalGilds'],
      totalLikes: map['totalLikes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'time': time,
      'text': text,
      'imageUrl': imageUrl,
      'totalGilds': totalGilds,
      'totalLikes': totalLikes,
    };
  }

  @override
  String toString() {
    return 'Post(userId: $userId, time: $time, text: $text, imageUrl: $imageUrl, totalGilds: $totalGilds, totalLikes: $totalLikes)';
  }
}
