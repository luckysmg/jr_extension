Language: [English](https://github.com/luckysmg/jr_extension/blob/master/README.md) | [中文简体](https://github.com/luckysmg/jr_extension/blob/master/README-CN.md)


# jr_extension

一个拥有众多拓展的flutter包

## 为什么我要做这个包？
在苹果公司的新框架 [SwiftUI](https://developer.apple.com/xcode/swiftui/)中，view都是被修饰符来表述的，也就是点语法，这样代码比较美观易读，但是看看
我们的flutter，无穷的嵌套，基本上是避免不了的，让代码变得很不好看

所以今天，我创建了这个包去尽可能避免一些嵌套代码，让代码易读一些，显得优雅一些^_^


## 开始着手
```dart
import 'package:jr_extension/jr_extension.dart';
```
过去我们这样写
```dart

        SizeBox(
            height: 300,
            Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              'bulabula',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
      );
```

今天你可以这样写
```dart
        Text(
          'bulabula',
        ).withStyle(fontSize: 20, fontWeight: FontWeight.bold)
         .padding(left: 5, right: 5)
         .withHeight(300),
         
```

## 上面只是一些最简单的示例，有一堆的扩展方法供你使用
```dart
/// 对所有的widget都可用
SizedBox withSize({double width = 0.0, double height = 0.0});
SizedBox withWidth(double width);
SizedBox withHeight(double height);
Expanded expand({int flex = 1});
DecoratedBox backgroundColor(Color color);
ClipRRect cornerRadius(double radius);
Padding padding({double top = 0.0,double left = 0.0,double bottom = 0.0,double right = 0.0});
Padding paddingAll(double padding);
Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0});
Padding paddingTop(double top);
Padding paddingLeft(double left);
Padding paddingRight(double right);
Padding paddingBottom(double bottom);

GestureDetector onTap(VoidCallback onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild});

GestureDetector onDoubleTap(VoidCallback onDoubleTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild});

GestureDetector onLongPress(VoidCallback onLongPress,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild});


/// Example:
/// Navigator.push(context, YourPage().withCupertinoRoute());
///
CupertinoPageRoute withCupertinoRoute({bool fullscreenDialog = false});
MaterialPageRoute withMaterialRoute({bool fullscreenDialog = false});

///
/// YourWidget().tapToPushCupertinoPageRoute(context, YourPage());
///         
GestureDetector tapToPushCupertinoPageRoute(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  });

 GestureDetector tapToPushMaterialRoute(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  });

GestureDetector tapToPushNamed(
    String name,
    dynamic args,
    BuildContext context, {
    bool rootNavigator = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  });


Widget visible(bool visible);
Widget opacity({@required double opacity});
Widget offset({@required Offset offset, bool transformHitTests = true});

Widget rotate(
      {@required double angle, bool transformHitTests = true, Offset origin});

Widget scale(
      {@required double scale,
      bool transformHitTests = true,
      Offset origin,
      Alignment alignment = Alignment.center});

Widget center({double heightFactor, double widthFactor});



/// 这个是专门给pageView里面的页面设计的，一行完成对页面状态的"保活"，避免划走页面被销毁
  /// example:
  ///  PageView.builder(itemBuilder: (BuildContext context, int index) {
  ///      return Page().keepAlive();
  ///    },);
  ///
Widget keepAlive(); 



/// 为Text量身定制，避免写一个style进行无穷嵌套
Text withStyle({
    double fontSize = 14,
    FontWeight fontWeight,
    Color color,
    FontStyle fontStyle,
    Paint foreground,
    double wordSpacing,
    Color backgroundColor,
    Color decorationColor,
    TextDecoration textDecoration,
    TextDecorationStyle decorationStyle,
    double decorationThickness,
    List<Shadow> shadows,
    double letterSpacing,
    Locale locale,
    TextBaseline textBaseline,
    Paint background,
    String fontFamily,
    List<String> fontFamilyFallback,
    List<FontFeature> fontFeatures,
    String debugLabel,
    double height,
    bool inherit,
  });

/// 给ScrollController做的嘿嘿
animToTop();
animToBottom();
jumpToTop();
jumpToBottom();
```


## 注意！！！如果你重视用户体验和性能，你需要关注以下几点
比如如果你要同时指定高度和宽度，
请不要这样写：

```dart
yourWidget().withHeight(20).withWidth(20);
```

应该这样写：
```dart
yourWidget().withSize(height:20,width:20);
```
这个规则也同样适用于padding之类的拓展

不要用：
```dart
yourWidget().paddingLeft(5).paddingRight(5);
```

而是应该：
```dart
yourWidget().padding(left: 5, right: 5);
```

## 我的其他包：
  [linked_scroll_widgets](https://pub.dev/packages/linked_scroll_widgets)
