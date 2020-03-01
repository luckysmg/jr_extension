import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jr_extension/jr_extension.dart';

class RouteExamplePage extends StatefulWidget {
  @override
  _RouteExamplePageState createState() => _RouteExamplePageState();
}

class _RouteExamplePageState extends State<RouteExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('页面跳转相关Exmaple'),
        ),
        body: Center(
                child: Text('点我进行跳转')
                    .withStyle(fontSize: 30, color: Colors.yellow)
                    .backgroundColor(Colors.red))
            .tapToPushCupertinoPageRoute(
          context,
          SecondPage(),
        )

        ///下面这些也可以就不一一列举了
        /// you can also use like this
        /// .tapToPushMaterialRoute(context, page)
        ///.tapToPushNamed(name, args, context),

        );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('第二个页面').withStyle(fontSize: 30),
      ),
    );
  }
}
