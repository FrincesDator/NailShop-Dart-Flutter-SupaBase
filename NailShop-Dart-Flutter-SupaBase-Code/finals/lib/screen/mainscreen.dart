import 'package:flutter/material.dart';
import 'package:finals/screen/homescreen.dart';
import 'package:finals/screen/menuscreen.dart';
import 'package:finals/screen/reviewscreen.dart';
import 'package:finals/constants/fonts.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'EME',
      style: optionStyle,
    ),
    Text(
      'KIMI',
      style: optionStyle,
    ),
    Text(
      'IHHH',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Center(
            child: Text(
              'CHICKFLEEKS',
              style: headingTextStyle,
            ),
          ),
          subtitle: Center(
            child: Text(
              'ONLINE NAIL SHOP',
              style: subheadingTextStyle,
            ),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Color(0xFFd7837f),
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF674846),
            width: 10,
          ),
        ),
      ),
      body: IndexedStack(
          index: _selectedIndex,
          children: [
            Home(),
            Menu(),
            Review(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: 'Reviews',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xFFd7837f),
        onTap: _onItemTapped,
      ),
    );
  }
}
