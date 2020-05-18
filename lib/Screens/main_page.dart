import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_app/Screens/main_screen.dart';
import 'package:new_app/Provider/font_size.dart';
import 'package:new_app/Provider/rate.dart';
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FontSizeNotify(),
        ),
        ChangeNotifierProvider(
          create: (_) => RateNotifiy(),
        ),
      ],
      child: MainScreen(),
    );
  }
}