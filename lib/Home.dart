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
                onTap: () {
                  //print("clique com onTap ${index}");
                  showDialog(
                      context: context,
                    builder: (context) {
                        return AlertDialog(
                          title: Text(_items[index]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                          content: Text(_items[index]["descricao"]),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  print("Selecionado YES");
                                  Navigator.pop(context);
                                },
                                child: Text("Yes")
                            ),
                            FlatButton(
                                onPressed: () {
                                  print("Selecionado NO");
                                  Navigator.pop(context);
                                },
                                child: Text("No")
                            )
                          ],
                        );
                    }
                  );
                },
                /*onLongPress: () {
                  print("clique com onLongPress");
                },*/
                title: Text(_items[index]["titulo"]),
                subtitle: Text(_items[index]["descricao"]),
              );
            }
        ),
      ),
    );
  }
}
