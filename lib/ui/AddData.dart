import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PageHome.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  void addData() {
    var url = "http://192.168.43.46/notes_flutter/addNote.php";
    http.post(url, body: {
      "title": titleController.text,
      "note": noteController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Add Notes'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new Column(
              children: [
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: titleController,
                    decoration: new InputDecoration(
                        hintText: "Input Judul Note",
                        labelText: "Judul Note",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: noteController,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                    decoration: new InputDecoration(
                        hintText: "Input Note",
                        labelText: "Notes",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Add Data"),
                  color: Colors.green,
                  onPressed: () {
                    addData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => PageHome()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
