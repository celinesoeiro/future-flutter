import 'dart:convert';

import 'package:consumo_web_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _baseUrl = "http://jsonplaceholder.typicode.com/";

  Future<List<Post>> _recoverPost() async {
    
    http.Response response = await http.get(_baseUrl + "posts");
    var data = json.decode(response.body);
    
    List<Post> posts = List();
    for (var p in data){
      Post post = Post(p["userId"],p["id"],p["title"],p["body"]);
      posts.add(post);
    }
    print(posts.toString());
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future')
      ),
      body: FutureBuilder<List<Post>>(
        future: _recoverPost(),
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('none');
              break;
            case ConnectionState.waiting:
              print('waiting');
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              print('active');
              break;
            case ConnectionState.done:
              print('done');
              if (snapshot.hasError){
                print("erro ao carregar a lista");
              } else {
                print('lista carregada com sucesso');
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    List<Post> list = snapshot.data;
                    Post post = list[index];

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body)
                    );
                  },
                );
              }
              break;
            default:
          }
          return Center(child: Text(""),);
        },
      ),
    );
  }
}