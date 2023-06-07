import 'package:flutter/material.dart';


import 'home_screen.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  String email = '';
  String code = '';

  bool showCodeField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Forget your password ? '),
        centerTitle: true,
        foregroundColor: Colors.purple,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your Email',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showCodeField = true;
                });
                print('Refactoring email has been sent to $email');
              },
              child: const Text('Refactoring password'),
            ),
            if (showCodeField)
              Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Enter the verification code',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        code = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      //print('Code confirmed: $code');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Text('Confirm Code'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PasswordResetPage(),
  ));
}
