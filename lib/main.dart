import 'package:flutter/material.dart';
import 'package:qrcodemaster/mainscreen.dart';
import 'qr_scanner.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Code',
      color: Colors.deepPurple,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainScreen(),
      routes: <String,WidgetBuilder>{
        '/scanner' : (BuildContext context) => new MyHomePage(),
      }
    );
  }
}
