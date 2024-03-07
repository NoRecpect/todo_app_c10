import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/settings_provider.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String routeName = "/";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return AnnotatedRegion <SystemUiOverlayStyle>(
         value:  const SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
    ),
      child: Scaffold(
        body: Image.asset(
          vm.isDark()
              ? "assets/images/splash _dark_background.png"
              : "assets/images/splash_light_background.png",
          fit: BoxFit.cover,
          height: mediaQuery.height,
          width: mediaQuery.width,
        ),
      ),
    );
  }
}
