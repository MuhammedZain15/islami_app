import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/layout/layout_view.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  static const String routename = "/";

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, layOutView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Image.asset(
      provider.isDark()
          ? "assets/images/splash_dark.png"
          : "assets/images/splash.png",
      fit: BoxFit.cover,
    );
  }
}
