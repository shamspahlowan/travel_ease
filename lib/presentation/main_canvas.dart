import 'package:flutter/material.dart';
import 'package:travel_ease/presentation/front_screen.dart';
import 'package:travel_ease/utils/theme.dart';

class MainCanvas extends StatefulWidget {
  const MainCanvas({super.key});

  @override
  State<MainCanvas> createState() => _MainCanvasState();
}

class _MainCanvasState extends State<MainCanvas> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/pngs/travelImage.png"), context);

    return MaterialApp(
      title: "Travel Ease",
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getTheme(),
      home: FrontScreen(),
    );
  }
}
