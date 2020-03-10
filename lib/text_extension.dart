import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text withStyle({
    dynamic fontSize = 14.0,
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
  }) {
    final style = TextStyle().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      foreground: foreground,
      wordSpacing: wordSpacing,
      backgroundColor: backgroundColor,
      decorationColor: decorationColor,
      decoration: textDecoration,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      shadows: shadows,
      letterSpacing: letterSpacing,
      locale: locale,
      textBaseline: textBaseline,
      background: background,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontFeatures: fontFeatures,
      debugLabel: debugLabel,
      height: height,
      inherit: inherit,
    );

    return Text(
      this.data,
      style: style,
      textAlign: this.textAlign,
      strutStyle: this.strutStyle,
      softWrap: this.softWrap,
      semanticsLabel: this.semanticsLabel,
      locale: this.locale,
      overflow: this.overflow,
      textWidthBasis: this.textWidthBasis,
      textDirection: this.textDirection,
      textScaleFactor: this.textScaleFactor,
      maxLines: this.maxLines,
    );
  }
}
