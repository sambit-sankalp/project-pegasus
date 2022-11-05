import 'package:flutter/material.dart';
import 'package:mondaymorning/src/services/themes/index.dart';
import 'package:mondaymorning/src/ui/screens/full_loading_screen.dart';

class FullLoadingPage extends StatelessWidget {
  const FullLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monday Morning',
      debugShowCheckedModeBanner: false,
      theme: MMTheme.materialLight,
      darkTheme: MMTheme.materialDark,
      themeMode: ThemeMode.system,
      home: FullLoadingScreen(),
    );
  }
}