import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    main();
    return Scaffold(
    );
  }
  }

void main () {

  fetchNewsName("New robots were presented");
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

Future<Map<String, String>> fetchNewsName(String name) async {
  var response = await http.get(
      'https://jsonplaceholder.typicode.com/users/$name');
  var map = json.decode(response.body) as Map;
  print({'name': map['name'], 'views_number': map['views_number']});
}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}

//const news = '<gathered news goes here>';
//const oneSecond = Duration(seconds: 1);

// Imagine that this function is more complex and slow. :)
//Future<String> gatherNewsReports() =>
    //Future.delayed(oneSecond, () => news);

