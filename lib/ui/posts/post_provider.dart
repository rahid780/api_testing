import 'dart:convert';

import 'package:api_testing/ui/posts/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostsData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        postList.add(PostModel.fromJson(data));
      }
      notifyListeners();
      print(postList);
      return postList;
    } else {
      return postList;
    }
  }
}
