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
}