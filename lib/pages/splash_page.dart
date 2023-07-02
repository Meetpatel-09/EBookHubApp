import 'dart:async';

import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, MyRoutes.landingPage, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset("assets/images/logo.jpg"),
        ),
      ),
    );
  }
}
