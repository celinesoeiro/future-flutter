import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _baseUrl = "http://jsonplaceholder.typicode.com/";

  _recoverPost(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future')
      ),
      body: FutureBuilder<Map>(
        future: _recoverPost(),
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('none');
              break;
            case ConnectionState.waiting:
              print('waiting');
              break;
            case ConnectionState.active:
              print('active');
              break;
            case ConnectionState.done:
              print('done');
              if (snapshot.hasError){
              } else {
                
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