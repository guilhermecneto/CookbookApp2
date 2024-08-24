import 'package:app2/home.dart';
import 'package:app2/models/color_selection.dart';
import 'package:flutter/material.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelection = ColorSelection.indigo;

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "ABeeZee", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      darkTheme: theme.dark(),
      theme: theme.light(),
      home: Home(
          changeTheme: (useLightMode) {
            setState(() {
              themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
            });
          },
          changeColor: (value) {},
          title: "Yummy",
          colorSelection: ColorSelection.indigo
      ),
    );
  }
}