import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_flutter/ui/PageHome.dart';

class EditData extends StatefulWidget {
  List list;
  int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  void editNote() {
    var url = "http://192.168.43.46/notes_flutter/editNote.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "title": titleController.text,
      "note": noteController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Notes'),
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
                  child: new Text("Edit Data"),
                  color: Colors.green,
                  onPressed: () {
                    editNote();
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

  @override
  void initState() {
    titleController =
        TextEditingController(text: widget.list[widget.index]['title']);

    noteController =
        TextEditingController(text: widget.list[widget.index]['note']);

    super.initState();
  }
}
