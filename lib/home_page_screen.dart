import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'book.dart';

var random = Random();
var randomNumber = random.nextInt(10) + 1;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Book> ebookBooks = [];
  List<Book> audioBooks = [];



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    for (var book in books) {
      if (book.isEbook) {
        ebookBooks.add(book);
      }
      if (book.isAudioBook) {
        audioBooks.add(book);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(List<Book> books) {
    return ListView(
      children: books.map((book) => _buildBookCard(book)).toList(),
    );
  }

  Widget _buildBookCard(Book book) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookPage(book: book),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(book.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${book.title}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Author: ${book.author}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description: ${book.description}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Share button action
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('Share'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add to cart button action
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Add to Cart'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookPage(book: books[randomNumber]),
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Center(
                child: Image.network(
                  ebookBooks.isNotEmpty ? ebookBooks[randomNumber].imageUrl : '',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Ebooks'),
              Tab(text: 'Audio Books'),
            ],
            indicatorColor: Colors.red, // تغییر رنگ هنگام تپ شدن روی تب
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTab(ebookBooks),
                _buildTab(audioBooks),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
