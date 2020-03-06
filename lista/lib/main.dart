import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: ("Nome Tarefa"),
                    labelStyle: TextStyle(color: Colors.blueAccent)
                  )             
                ),
                RaisedBi
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Future<File> _getFile() async { //sempre que necessário acessar o arquivo utiliza-se o "_getFile()"
    final directory = await getApplicationDocumentsDirectory(); //retorna o diretório onde pode-se salvar
    return File("${directory.path}/data.json"); //pega o caminho e concatena com "/data.json". Assim pode-se abrir o arquivo atras do "File"/
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList); //pega a lista, transforma-a em um json e está armazenado uma string
    final file = await _getFile(); //pegamos o arquivo
    return file.writeAsString(data); //escrevemos os dados da lista de tarefas como texto dentro do arquivo
  }

  Future<String> _readData() async {
    try{
      final file = await _getFile();
      return file.readAsString(); //faz a leitura e retorna os dados
    } catch (exception){
      return null;
    }
  }
}



