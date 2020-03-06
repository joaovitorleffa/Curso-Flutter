
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

const request = "https://swapi.co/api/people";

void main() async{
  print(await getData());
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(000),
      appBar: AppBar(
        title: Text("StarWars"),
        backgroundColor: Colors.amber,
        centerTitle: true
      ),
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text("Carregando os Dados!", style: TextStyle(color: Colors.white),)
              );
            default:
              if (snapshot.hasError) {

                return Center (
                    child: Text("Erro ao Carregar Dados :(",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25.0),
                        textAlign: TextAlign.center)
                );
              } else {
                people = snapshot.data["results"]["name"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Pessoa: $people", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                );
              }
          }
        }
      )
    );
  }
}

Future<dynamic> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}