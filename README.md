# jr_extension

An awesome Flutter package with widget extension.

## Why do I want to create this lib?
In [SwiftUI](https://developer.apple.com/xcode/swiftui/) framework created by apple,views use modifier to declare what the views look,which makes code readable.
But in flutter,we usually use some nested code to setup the properties,making the code very ugly...

So today,I create this lib to avoid nested code as possible as I can,to make code readble and elegant.


## Get started


import package in your dart file:
```dart
import 'package:jr_extension/jr_extension.dart';
```


In the past we coded like this
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
      )
```

today you code like this
```dart
        Text(
          'bulabula',
        ).withStyle(fontSize: 20, fontWeight: FontWeight.bold)
         .padding(left: 5, right: 5)
         .withHeight(300),
         
```

## It is a very simple example,it has a lot of usages like this
## And it is very easy to underStand 
```dart
/// for all widgets
SizedBox withSize({double width = 0.0, double height = 0.0})
SizedBox withWidth(double width)
SizedBox withHeight(double height)
Expanded expand({int flex = 1})
DecoratedBox backgroundColor(Color color)
ClipRRect cornerRadius(double radius)
Padding padding({double top = 0.0,double left = 0.0,double bottom = 0.0,double right = 0.0})
Padding paddingAll(double padding)
Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0})
Padding paddingTop(double top)
Padding paddingLeft(double left)
Padding paddingRight(double right)
Padding paddingBottom(double bottom)

GestureDetector onTap(VoidCallback onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild})

GestureDetector onDoubleTap(VoidCallback onDoubleTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild})

GestureDetector onLongPress(VoidCallback onLongPress,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild})


/// Example:
/// Navigator.push(context, YourPage().withCupertinoRoute());
///
CupertinoPageRoute withCupertinoRoute({bool fullscreenDialog = false})
MaterialPageRoute withMaterialRoute({bool fullscreenDialog = false})

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
  })

 GestureDetector tapToPushMaterialRoute(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  })

GestureDetector tapToPushNamed(
    String name,
    dynamic args,
    BuildContext context, {
    bool rootNavigator = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  })


/// This is a extension work better especially for the page in PageView
  /// example:
  ///  PageView.builder(itemBuilder: (BuildContext context, int index) {
  ///      return Page().keepAlive();
  ///    },);
  ///
  Widget keepAlive() {
    return _KeepAliveWidget(this);
  }


/// useful only on Text 
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
  })

/// for scrollController
animToTop()
animToBottom()
jumpToTop()
jumpToBottom()
```


## Attention!!! Important for the best user experience
if you want your widget has exactly height and Width
please don't use

```dart
yourWidget().withHeight(20).withWidth(20);
```

you should code like this:

```dart
yourWidget().withSize(height:20,width:20);
```
This rule is also vaild for padding 
don't use:
```dart
yourWidget().paddingLeft(5).paddingRight(5);
```

use like this
```dart
yourWidget().padding(left: 5, right: 5);
```
