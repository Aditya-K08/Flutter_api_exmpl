import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/models/post.dart';

class PostService {
  Future<List<Welcome>?> getPst() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    }
  }
}
