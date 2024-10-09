class Post {
  String? name;
  String? title;
  String? price;
  String? image_url;
  String? postID;

  Post({this.name, this.title, this.price, this.image_url, this.postID});

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        postID = json['postID'],
        title = json['title'],
        price = json['price'],
        image_url = json['image_url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'postID': postID,
        'price': price,
        'image_url': image_url,
      };
}
