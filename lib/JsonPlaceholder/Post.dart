import 'package:http/http.dart' as http;
import 'dart:convert';

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}

Future<List<Post>> fetchPosts() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  List<Post> lists = [];
  if(response.statusCode == 200){

    List jsonPosts = json.decode(response.body);
    lists = jsonPosts.map((p) => Post.fromJson(p)).toList();
    print('completed');
  } else {
    print('exception thrown');
    throw Exception('Failed to load posts');
  }
  return lists;
}