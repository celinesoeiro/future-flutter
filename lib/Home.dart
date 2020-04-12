import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map> _getPrice() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _getPrice(),
      builder: (context, snapshot){
        String result;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print('none');
            break;
          case ConnectionState.waiting:
            result = "Carregando...";
            print('waiting');
            break;
          case ConnectionState.active:
            print('active');
            break;
          case ConnectionState.done:
            print('done');
            if (snapshot.hasError){
              result = "Erro ao carregar";
            } else {
              double value = snapshot.data["BRL"]["buy"];
              result = "Preço do bitcoin: ${value.toString()}";
            }
            break;
          default:
        }
        return Center(child: Text(result),);
      },
    );
  }
}