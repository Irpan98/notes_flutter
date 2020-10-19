import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_flutter/ui/PageHome.dart';

import 'EditData.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.list, this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.43.46/notes_flutter/deleteNote.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are you Sure want to Delete ${widget.list[widget.index]['title']} "),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => PageHome()));
          },
          child: new Text(
            'Ok Delete!',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(
            'CANCEL',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.green,
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['note']}"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 30)),
                          Text(
                            widget.list[widget.index]['title'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.list[widget.index]['note'],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                child: Text('Edit'),
                                color: Colors.deepOrangeAccent,
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => EditData(
                                      list: widget.list,
                                      index: widget.index,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              RaisedButton(
                                child: new Text('Delete'),
                                color: Colors.blue,
                                onPressed: () => confirm(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
