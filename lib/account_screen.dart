import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Account',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Color> _buttonColors = [];

  @override
  void initState() {
    super.initState();
    _generateButtonColors();
  }

  void _generateButtonColors() {
    List<Color> colors = _generateRandomColors(8);
    setState(() {
      _buttonColors = colors;
    });
  }

  List<Color> _generateRandomColors(int count) {
    final Random random = Random();
    List<Color> colors = [];

    for (int i = 0; i < count; i++) {
      final int red = random.nextInt(256);
      final int green = random.nextInt(256);
      final int blue = random.nextInt(256);
      final Color color = Color.fromARGB(255, red, green, blue);
      colors.add(color);
    }

    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('User Account'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            // TODO: تغییر تم به حالت تیره یا روشن
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.card_giftcard),
            onPressed: () {
              //  دکمه کادو
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              //  دکمه زنگوله
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage("https://namakstan.net/wp-content/uploads/2016/06/salar-0-aghili-namakstan.ir-2.jpg"),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'User Info',
              color: _buttonColors[0],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserInfoPage()),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'Reading Activity',
              color: _buttonColors[1],
              onPressed: () {
                // انتقال به صفحه Reading Activity
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'Invite Friends',
              color: _buttonColors[2],
              onPressed: () {
                // انتقال به صفحه Invite Friends
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'My Comments',
              color: _buttonColors[3],
              onPressed: () {
                // انتقال به صفحه My Comments
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'My Quotes',
              color: _buttonColors[4],
              onPressed: () {
                // انتقال به صفحه My Quotes
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: AccountButton(
              title: 'Settings',
              color: _buttonColors[5],
              onPressed: () {
                // انتقال به صفحه Settings
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: AccountButton(
                title: 'Logout',
                color: _buttonColors[6],
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text('User Info Page'),
      ),
    );
  }
}
