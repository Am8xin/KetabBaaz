import 'package:flutter/material.dart';
import 'package:p1/library_screen.dart';
import 'package:p1/main.dart';
import 'dart:math';
import './home_page_screen.dart';
import 'account_screen.dart';
import 'store.dart';


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Color> _buttonColors =
  List.generate(4, (index) => Colors.accents[Random().nextInt(Colors.accents.length)]); // لیستی از رنگ‌های شانسی

  static final List<Widget> _widgetOptions = <Widget>[
    const MyHomePage(title: '',),
    const LibraryPage(),
    const AccountPage(),
    StorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.redAccent,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            backgroundColor: Colors.deepPurple,
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            backgroundColor: Colors.brown,
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            backgroundColor: Colors.lightBlue,
            label: 'Store',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _buttonColors[_selectedIndex],
        unselectedItemColor: _buttonColors[_selectedIndex],
        backgroundColor: _buttonColors[_selectedIndex],
        onTap: _onItemTapped,
      ),
    );
  }
}