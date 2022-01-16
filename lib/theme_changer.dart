import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Brightness brightness) builder;
  final defaultBrightness;

  const ThemeBuilder({
    required this.builder,
    required this.defaultBrightness,
  });
  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();

  static _ThemeBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeBuilderState>();
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  late Brightness _brightness;
  late bool isDark = false;

  @override
  void initState() {
    super.initState();

    _brightness = widget.defaultBrightness;

    if (mounted) {
      setState(() {});
    }
  }

  void changeTheme() {
    setState(() {
      _brightness =
          _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness);
  }
}
