import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

///
/// @created by 文景睿
/// description:flutter widgets extension
///
extension WidgetExtension on Widget {
  ///
  ///if you have more than one padding property to set,use this:
  /// yourWidget.withSize(height:5,width:5)
  ///
  /// instead of using this :
  /// yourWidget.withHeight(5).withWidth(5)
  ///
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  SizedBox withWidth(double width) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  SizedBox withHeight(double height) {
    return SizedBox(
      height: height,
      child: this,
    );
  }

  Expanded expand({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  DecoratedBox backgroundColor(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  ClipRRect cornerRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  ///
  ///if you have more than one padding property to set,use this:
  /// yourWidget.padding(top:5,left:5)
  ///
  /// instead of using this :
  /// yourWidget.paddingTop(5).paddingLeft(5)
  ///
  Padding padding(
      {double top = 0.0,
      double left = 0.0,
      double bottom = 0.0,
      double right = 0.0}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Padding paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Padding paddingTop(double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Padding paddingLeft(double left) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Padding paddingRight(double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  Padding paddingBottom(double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  GestureDetector onTap(VoidCallback onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onTap: onTap,
      child: this,
    );
  }

  GestureDetector onDoubleTap(VoidCallback onDoubleTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  GestureDetector onLongPress(VoidCallback onLongPress,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild}) {
    return GestureDetector(
      behavior: hitTestBehavior,
      onLongPress: onLongPress,
      child: this,
    );
  }

  ///it is very like onTap extension but when you put your finger on it, its color will change,
  ///and you can decide that whether it will have a touchFeedBack (vibration on your phone)
  ///
  /// 他很像 onTap 拓展，区别在于你把你的手指放上去的时候，他颜色会改变，有一个视觉上的反馈，
  /// 另外，你还可以通过控制touchFeedBack 变量来让其点击后震动，获得触摸反馈.
  ///
  Widget onFeedBackTap(VoidCallback onTap,
      {HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild,
      bool touchFeedBack = false}) {
    return _CallbackButton(
      child: this,
      onTap: onTap,
      needHaptic: touchFeedBack,
      hitTestBehavior: hitTestBehavior,
    );
  }

  CupertinoPageRoute withCupertinoRoute({bool fullscreenDialog = false}) {
    /// Example:
    /// Navigator.push(context, YourPage().withCupertinoRoute());
    ///
    return CupertinoPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (ctx) {
          return this;
        });
  }

  MaterialPageRoute withMaterialRoute({bool fullscreenDialog = false}) {
    return MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (ctx) {
          return this;
        });
  }

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
  }) {
    VoidCallback temp = () async {
      var result;
      result = await Navigator.of(context, rootNavigator: rootNavigator)
          .push(page.withCupertinoRoute(fullscreenDialog: fullscreenDialog));
      callback(result);
    };
    return GestureDetector(
      behavior: hitTestBehavior,
      onTap: temp,
      child: this,
    );
  }

  GestureDetector tapToPushMaterialRoute(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  }) {
    var result;
    VoidCallback temp = () async {
      result = await Navigator.of(context, rootNavigator: rootNavigator)
          .push(page.withMaterialRoute(fullscreenDialog: fullscreenDialog));
      callback(result);
    };
    return GestureDetector(
      behavior: hitTestBehavior,
      onTap: temp,
      child: this,
    );
  }

  GestureDetector tapToPushNamed(
    String name,
    dynamic args,
    BuildContext context, {
    bool rootNavigator = false,
    Function(dynamic result) callback,
    HitTestBehavior hitTestBehavior,
  }) {
    var result;
    VoidCallback temp = () async {
      result = await Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(name, arguments: args);
      callback(result);
    };
    return GestureDetector(
      behavior: hitTestBehavior,
      onTap: temp,
      child: this,
    );
  }

  ///
  /// This is a extension work better especially for the page in PageView
  /// example:
  ///  PageView.builder(itemBuilder: (BuildContext context, int index) {
  ///      return Page().keepAlive();
  ///    },);
  ///
  Widget keepAlive() {
    return _KeepAliveWidget(this);
  }

  Widget visible(bool visible) {
    return visible ? this : const SizedBox();
  }

  Widget opacity({@required double opacity}) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(),
      child: this,
    );
  }

  Widget offset({@required Offset offset, bool transformHitTests = true}) {
    return Transform.translate(
      transformHitTests: transformHitTests,
      offset: offset,
      child: this,
    );
  }

  Widget rotate(
      {@required double angle, bool transformHitTests = true, Offset origin}) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  Widget scale(
      {@required double scale,
      bool transformHitTests = true,
      Offset origin,
      Alignment alignment = Alignment.center}) {
    return Transform.scale(
      alignment: alignment,
      scale: scale,
      origin: origin,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  Widget center({double heightFactor, double widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  SliverToBoxAdapter sliverBoxAdapter() {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  ///Maybe often use this when you want to make your own AppBar or NavigationBar with your custom UI
  ///
  /// tip:the size of ios navigation bar is Size.fromHeight(44.0) [kMinInteractiveDimensionCupertino],
  /// material style appBar is Size.fromHeight(56.0)   [kToolbarHeight],
  ///
  /// example:
  ///  appBar: Center(
  ///   child: Text("hello"),
  /// ).preferredSize(Size.fromHeight(44.0)),
  PreferredSize preferredSize(Size size) {
    return PreferredSize(child: this, preferredSize: size);
  }
}

class _KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const _KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<_KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

class _CallbackButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color normalColor;
  final Color pressedColor;
  final bool needHaptic;
  final HitTestBehavior hitTestBehavior;

  const _CallbackButton(
      {Key key,
      this.onTap,
      this.child,
      this.normalColor = Colors.transparent,
      this.pressedColor = Colors.black12,
      this.needHaptic = false,
      this.hitTestBehavior})
      : super(key: key);

  @override
  _CallbackButtonState createState() => _CallbackButtonState();
}

class _CallbackButtonState extends State<_CallbackButton> {
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.hitTestBehavior,
      onTap: widget.onTap,
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTapCancel: handleCancel,
      child: Container(
        color: bgColor,
        child: widget.child,
      ),
    );
  }

  void handleTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      bgColor = widget.pressedColor;
    });
  }

  void handleCancel() {
    setState(() {
      bgColor = widget.normalColor;
    });
  }

  void handleTapUp(TapUpDetails tapDownDetails) {
    if (widget.needHaptic) {
      HapticFeedback.heavyImpact();
    }
    setState(() {
      bgColor = widget.normalColor;
    });
  }
}

typedef AnimationUpdateCallBack<T> = Function(T value, double percent);

withAnimation<T>(
    {@required TickerProvider vsync,
    @required Tween<T> tween,
    @required AnimationUpdateCallBack<T> callBack,
    Duration duration = const Duration(seconds: 1),
    double initialValue = 0.0,
    VoidCallback onComplete,
    Curve curve = Curves.linear}) {
  AnimationController controller = AnimationController(
      vsync: vsync, duration: duration, value: initialValue);
  final curveAnimation = CurvedAnimation(parent: controller, curve: curve);
  final Animation animation = tween.animate(curveAnimation);
  animation.addListener(() {
    callBack?.call(animation.value, controller.value);
  });

  controller.forward().whenCompleteOrCancel(() {
    onComplete?.call();
    controller.dispose();
  });
}
