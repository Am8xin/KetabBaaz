import 'package:flutter/material.dart';
import 'book.dart';

void main() => runApp(StorePage());

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Book> filteredBooks = List.from(books); // لیست فیلترشده از کتاب‌ها

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Book Store App'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  filterBooks(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBooks.length, // تعداد آیتم‌ها از لیست فیلترشده
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(filteredBooks[index].imageUrl),
                    title: Text(filteredBooks[index].title),
                    subtitle: Text(filteredBooks[index].author),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookPage(book: filteredBooks[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterBooks(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        // اگر عبارت جستجو خالی بود، لیست فیلترشده را برابر با کل کتاب‌ها قرار بدهید
        filteredBooks = List.from(books);
      } else {
        // اگر فیلد جستجو خالی نبود، کتاب‌هایی را که عبارت جستجو در عنوان یا نویسنده آن‌ها وجود دارد انتخاب کنید
        filteredBooks = books.where((book) => book.title.toLowerCase().contains(searchText.toLowerCase()) || book.author.toLowerCase().contains(searchText.toLowerCase())).toList();
      }
    });
  }
}
