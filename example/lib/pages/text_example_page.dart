import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jr_extension/jr_extension.dart';

class TextExamplePage extends StatefulWidget {
  @override
  _TextExamplePageState createState() => _TextExamplePageState();
}

class _TextExamplePageState extends State<TextExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("文字扩展使用示例"),
      ),
      body: Text("这是一行文字")
          .withStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red)
          .backgroundColor(Colors.amberAccent)
          .cornerRadius(20)
          .center(),
    );
  }
}
