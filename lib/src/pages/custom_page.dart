import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatefulWidget {
  CustomPage({Key key}) : super(key: key);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Page'),
      ),
      body: Container(
        child: Center(child: Text('Texto body')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Pulsado');

          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Text('Opcion 1'),
                    onPressed: () {
                      print('Action sheet pulsado');
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
