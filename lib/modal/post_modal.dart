class Post {
  String? name;
  String? title;
  String? price;

  Post({this.name, this.title, this.price});

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        title = json['title'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'price': price,
      };
}
