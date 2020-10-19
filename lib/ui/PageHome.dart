import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AddData.dart';
import 'Detail.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.46/notes_flutter/getNotes.php");

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddData()));
          }),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: List == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Detail(list: list, index: i),
                ));
              },
              child: new Card(
                color: Colors.white,
                child: new ListTile(
                  title: new Text(list[i]['title']),
                  leading: new Icon(Icons.list),
                ),
              ),
            ),
          );
        });
  }
}
