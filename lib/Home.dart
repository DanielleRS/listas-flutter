import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _items = [];

  void _loadItems() {
    _items = [];
    for(int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();

      item["titulo"] = "Título ${i} Lorem ipsum.";
      item["descricao"] = "Descrição ${i} ipsum dolor";

      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _loadItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              //Map<String, dynamic> item = _items[index];
              //print("item ${item["titulo"]}");

              return ListTile(
                title: Text(_items[index]["titulo"]),
                subtitle: Text(_items[index]["descricao"]),
              );
            }
        ),
      ),
    );
  }
}
