import 'package:flutter/widgets.dart';

class Font {
  Font._();

  static CustomFontWeight get headerTextStyle => const CustomFontWeight('Lora');
  static CustomFontWeight get bodyTextStyle => const CustomFontWeight('Lato');

  static TextStyle header16semiBold = Font.headerTextStyle.semiBold.size16;
  static TextStyle header16 = Font.headerTextStyle.bold.size16;
  static TextStyle header17 = Font.headerTextStyle.bold.size17;
  static TextStyle header20 = Font.headerTextStyle.bold.size20;
  static TextStyle header22 = Font.headerTextStyle.bold.size22;
  static TextStyle header24 = Font.headerTextStyle.semiBold.size24;
  static TextStyle header24Light = Font.headerTextStyle.regular.size24;
  static TextStyle header26 = Font.bodyTextStyle.black.size26;
  static TextStyle header36 = Font.headerTextStyle.bold.size36;

  static TextStyle body9 = Font.bodyTextStyle.black.size9;
  static TextStyle body12light = Font.bodyTextStyle.light.size12;
  static TextStyle body12 = Font.bodyTextStyle.regular.size12;
  static TextStyle body13Italic = Font.bodyTextStyle.regularItalic.size13;
  static TextStyle body14 = Font.bodyTextStyle.regular.size14;
  static TextStyle body14SemiBold = Font.bodyTextStyle.semiBold.size14;
  static TextStyle body14Italic = Font.bodyTextStyle.regularItalic.size14;
  static TextStyle body15 = Font.bodyTextStyle.regular.size15;
  static TextStyle body16 = Font.bodyTextStyle.regular.size16;
  static TextStyle body16Light = Font.bodyTextStyle.light.size16;
  static TextStyle body16Italic = Font.bodyTextStyle.regularItalic.size16;
  static TextStyle body18 = Font.bodyTextStyle.light.size18;
  static TextStyle body18Italic = Font.bodyTextStyle.lightItalic.size18;
  static TextStyle body20 = Font.bodyTextStyle.regular.size20;
  static TextStyle body20Bold = Font.bodyTextStyle.bold.size20;
  static TextStyle body21 = Font.bodyTextStyle.light.size21;
  static TextStyle body21Italic = Font.bodyTextStyle.regularItalic.size21;
  static TextStyle body22 = Font.bodyTextStyle.regular.size22;
  static TextStyle body22Light = Font.bodyTextStyle.light.size22;
  static TextStyle body24 = Font.bodyTextStyle.regular.size24;
  static TextStyle body24Italic = Font.bodyTextStyle.regularItalic.size24;
  static TextStyle body24Light = Font.bodyTextStyle.light.size24;
  static TextStyle body70Bold = Font.bodyTextStyle.bold.size70;
}

class CustomFontWeight {
  const CustomFontWeight(this._fontName);

  final String _fontName;

  CustomFontSize get thin =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-Thin'));
  CustomFontSize get light =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-Light'));
  CustomFontSize get lightItalic => CustomFontSize(TextStyle(
      fontFamily: '$_fontName-LightItalic', fontStyle: FontStyle.italic));

  CustomFontSize get regular =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-Regular'));
  CustomFontSize get regularItalic => CustomFontSize(
      TextStyle(fontFamily: '$_fontName-Italic', fontStyle: FontStyle.italic));

  CustomFontSize get semiBold =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-SemiBold'));
  CustomFontSize get bold =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-Bold'));
  CustomFontSize get black =>
      CustomFontSize(TextStyle(fontFamily: '$_fontName-Black'));
}

class CustomFontSize {
  const CustomFontSize(this._textStyle);

  final TextStyle _textStyle;

  TextStyle get size9 => _textStyle.copyWith(fontSize: 9);
  TextStyle get size10 => _textStyle.copyWith(fontSize: 10);
  TextStyle get size11 => _textStyle.copyWith(fontSize: 11);
  TextStyle get size12 => _textStyle.copyWith(fontSize: 12);
  TextStyle get size13 => _textStyle.copyWith(fontSize: 13);
  TextStyle get size14 => _textStyle.copyWith(fontSize: 14);
  TextStyle get size15 => _textStyle.copyWith(fontSize: 15);
  TextStyle get size16 => _textStyle.copyWith(fontSize: 16);
  TextStyle get size17 => _textStyle.copyWith(fontSize: 17);
  TextStyle get size18 => _textStyle.copyWith(fontSize: 18);
  TextStyle get size19 => _textStyle.copyWith(fontSize: 19);
  TextStyle get size20 => _textStyle.copyWith(fontSize: 20);
  TextStyle get size21 => _textStyle.copyWith(fontSize: 21);
  TextStyle get size22 => _textStyle.copyWith(fontSize: 22);
  TextStyle get size23 => _textStyle.copyWith(fontSize: 23);
  TextStyle get size24 => _textStyle.copyWith(fontSize: 24);
  TextStyle get size25 => _textStyle.copyWith(fontSize: 25);
  TextStyle get size26 => _textStyle.copyWith(fontSize: 26);
  TextStyle get size27 => _textStyle.copyWith(fontSize: 27);
  TextStyle get size30 => _textStyle.copyWith(fontSize: 30);
  TextStyle get size36 => _textStyle.copyWith(fontSize: 35);
  TextStyle get size48 => _textStyle.copyWith(fontSize: 48);
  TextStyle get size50 => _textStyle.copyWith(fontSize: 50);
  TextStyle get size70 => _textStyle.copyWith(fontSize: 70);
}

extension TextStyleExtensions on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color?.withOpacity(opacity));
  }
}
