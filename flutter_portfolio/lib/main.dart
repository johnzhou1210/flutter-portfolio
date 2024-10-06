// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/home.dart';
import 'package:flutter_portfolio/aboutme.dart';
import 'package:flutter_portfolio/portfolio.dart';
import 'package:flutter_portfolio/contact.dart';
import 'package:flutter_portfolio/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> sections = <String>['Home', 'About Me', 'Portfolio', 'Contact'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Zhou Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Navigator(),
    );
  }
}

class Navigator extends StatefulWidget {
  const Navigator({super.key});
  @override
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadTabIndex();
  }

  Future<void> _loadTabIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currTabIndex = prefs.getInt('tabIndex') ?? 0;
      print("tabIndex retrieved: $_currTabIndex");

      _tabController = TabController(
          length: sections.length, initialIndex: _currTabIndex, vsync: this);
    });
  }

  Future<void> _saveTabIndex(int indx) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('tabIndex', indx);
    print("tabIndex set to $indx");
  }

  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: const Text(
          'John Zhou',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            _saveTabIndex(0);
            html.window.location.reload();
          },
          icon: const Icon(Icons.home),
          tooltip: 'Home',
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (newIndx) {
            setState(() {
              _currTabIndex = newIndx;
              _saveTabIndex(newIndx);
            });
          },
          tabs: sections.map((section) => Tab(text: section)).toList(),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              String fileUrl =
                  'https://drive.google.com/file/d/10QNHN_C_h2AxeHVqApq9a82BVIOz3aTO/view?usp=sharing';
              LaunchURL(fileUrl);
            },
            icon: const Icon(Icons.download),
            label: const Text('Resume'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Home()),
            Center(child: AboutMe()),
            Center(child: Portfolio()),
            Center(child: Contact())
          ],
        ),
      ),
    );
  }
}
