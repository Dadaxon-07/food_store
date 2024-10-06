class Post {
  String? name;
  String? title;
  String? price;
  String? image_url;

  Post({this.name, this.title, this.price, this.image_url});

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        title = json['title'],
        price = json['price'],
        image_url = json['image_url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'price': price,
        'image_url': image_url,
      };
}
