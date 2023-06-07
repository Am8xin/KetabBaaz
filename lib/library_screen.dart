import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

void main() {
  runApp(const LibraryPage());
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => _onItemTapped(0),
                    icon: const Icon(Icons.bookmark),
                    color: _selectedIndex == 0 ? Colors.lime : Colors.brown,
                  ),
                  IconButton(
                    onPressed: () => _onItemTapped(1),
                    icon: const Icon(Icons.border_all),
                    color: _selectedIndex == 1 ? Colors.deepPurpleAccent : Colors.black54,
                  ),
                  IconButton(
                    onPressed: () => _onItemTapped(2),
                    icon: const Icon(Icons.list),
                    color: _selectedIndex == 2 ? Colors.yellowAccent : Colors.black38,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
