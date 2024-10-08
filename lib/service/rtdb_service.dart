import 'dart:convert';


import 'package:firebase_database/firebase_database.dart';

import '../modal/post_modal.dart';

class RTDBService {
  static final _databse = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(Post post) async {
    _databse.child("post").push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getPosts() async {
    List<Post> items = [];

    Query query = _databse.ref.child("post");
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);

      var post = Post(
          name: map['name'], title: map['title'], price: map['price'], image_url: map['image_url']);
      items.add(post);
    }
    return items;
  }

  static Future<Stream<DatabaseEvent>>addIchimlik(Post post)async{
    _databse.child('ichimliklar').push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getIchimlik()async{
    List<Post> ichimlik = [];

    Query query = _databse.ref.child("ichimliklar");
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for(var child in snapshot.children){
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);

      var post = Post(
        name: map['name'], title: map['title'], price: map['price'], image_url: map['image_url']

      );
      ichimlik.add(post);
    }
    return ichimlik;

  }

  static Future<Stream<DatabaseEvent>>addSweet(Post post)async{
    _databse.child('Shirinliklar').push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getSweet()async{
    List<Post> shirinliklar = [];

    Query query = _databse.ref.child("Shirinliklar");
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for(var child in snapshot.children){
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);

      var post = Post(
        name: map['name'], title: map['title'], price: map['price'], image_url: map['image_url']

      );
      shirinliklar.add(post);
    }
    return shirinliklar;

  }

  static Future<Stream<DatabaseEvent>>addFood(Post post)async{
    _databse.child('Taomlar').push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getFood()async{
    List<Post> taomlar = [];

    Query query = _databse.ref.child("Taomlar");
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for(var child in snapshot.children){
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);

      var post = Post(
        name: map['name'], title: map['title'], price: map['price'], image_url: map['image_url']

      );
      taomlar.add(post);
    }
    return taomlar;

  }
}