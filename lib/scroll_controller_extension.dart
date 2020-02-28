import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

extension ScrollControllerExtension on ScrollController {
  void animToTop() {
    this.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void animToBottom() {
    this.animateTo(this.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void jumpToTop() {
    this.jumpTo(0);
  }

  void jumpToBottom() {
    this.jumpTo(this.position.maxScrollExtent);
  }
}
