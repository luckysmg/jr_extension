import 'package:example/pages/route_example_page.dart';
import 'package:example/pages/text_example_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jr_extension/jr_extension.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Example'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          _buildItem("Text使用示例", () {
            Navigator.push(context, TextExamplePage().withCupertinoRoute());
          }),
          _buildItem('路由相关示例', () {
            Navigator.push(context, RouteExamplePage().withCupertinoRoute());
          }),
        ],
      ),
    );
  }

  Widget _buildItem(String text, VoidCallback onTap) {
    return Row(
      children: <Widget>[
        Text(text).withStyle(fontSize: 20),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ).withHeight(40).paddingAll(8).onTap(onTap);
  }
}
