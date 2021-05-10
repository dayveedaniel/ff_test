class NewsModel {
  List<dynamic> posts;

  int userId;
  String firstName; //frommap
  String lastName; //frommap
  String caption;
  String photoId;
  Map<String, dynamic> user;

  NewsModel({
    this.userId,
    this.caption,
    this.photoId,
    this.user,
    this.lastName,
    this.firstName,
    this.posts,
  });

   NewsModel.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] as String;
    userId = json['userId'] as int;
    photoId = json['photoId'] as String;
    user = json['user'] as Map;
    firstName = user['firstName'] as String;
    lastName = user['lastName'] as String;

  }
}
