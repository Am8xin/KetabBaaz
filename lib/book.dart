import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final bool isEbook;
  final bool isAudioBook;

  const Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.isEbook,
    required this.isAudioBook,
  });
}

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text(book.title),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(book.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Author: ${book.author}',
                    style: const TextStyle(fontSize: 18),
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
                          // Save button action
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Save'),
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
}

final List<Book> books = [
  const Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    imageUrl: 'https://newcdn.fidibo.com/images/books/91759_68036_normal.jpg?width=200',
    description: 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan' ,
    isEbook: true,
    isAudioBook: false,
  ),
  const Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    imageUrl: 'https://newcdn.fidibo.com/images/books/128108_91035_normal.jpg?width=200',
    description: 'It is set in the fictional town of Maycomb, Ala., during the Great Depression. The protagonist is Jean Louise (“Scout”) Finch, an intelligent and unconventional girl who ages from six to nine years old during the course of the novel.',
    isEbook: true,
    isAudioBook: true,
  ),
  const Book(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    imageUrl: 'https://newcdn.fidibo.com/images/books/87185_56180_normal.jpg?width=200',
    description: 'Pride and Prejudice follows the turbulent relationship between Elizabeth Bennet, the daughter of a country gentleman, and Fitzwilliam Darcy, a rich aristocratic landowner',
    isEbook: true,
    isAudioBook: true,
  ),
  const Book(
    title: '1984',
    author: 'George Orwell',
    imageUrl: 'https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200',
    description: 'Nineteen Eighty-four, also published as 1984, novel by English author George Orwell published in 1949 as a warning against totalitarianism. The chilling dystopia made a deep impression on readers, and his ideas entered mainstream culture in a way achieved by very few books. The book’s title and many of its concepts, such as Big Brother and the Thought Police, are instantly recognized and understood, often as bywords for modern social and political abuses.',
    isEbook: false,
    isAudioBook: true,
  ),
  const Book(
    title: 'Animal Farm',
    author: 'George Orwell',
    imageUrl: 'https://newcdn.fidibo.com/images/books/113528_34161_normal.jpg?width=200',
    description: 'Animal Farm is a beast fable, in the form of a satirical allegorical novella, by George Orwell, first published in England on 17 August 1945. It tells the story of a group of farm animals who rebel against their human farmer, hoping to create a society where the animals can be equal, free, and happy',
    isEbook: true,
    isAudioBook: false,
  ),
  const Book(
    title: 'Brave New World',
    author: 'Aldous Huxley',
    imageUrl: 'https://newcdn.fidibo.com/images/books/144765_13511_normal.jpg?width=200',
    description: 'The novel examines a futuristic society, called the World State, that revolves around science and efficiency. In this society, emotions and individuality are conditioned out of children at a young age, and there are no lasting relationships because “every one belongs to every one else” (a common World State dictum)',
    isEbook: true,
    isAudioBook: true,
  ),
  const Book(
    title: 'The Sun Also Rises',
    author: 'Ernest Hemingway',
    imageUrl: 'https://newcdn.fidibo.com/images/books/1402_35025_normal.jpg?width=200',
    description: 'The Sun Also Rises follows a group of young American and British expatriates as they wander through Europe in the mid-1920s. They are all members of the cynical and disillusioned Lost Generation, who came of age during World War I (1914–18).',
    isEbook: false,
    isAudioBook: true,
  ),
  const Book(
    title: '5 AM club',
    author: 'Nella Larsen',
    imageUrl: 'https://newcdn.fidibo.com/images/books/97994_84441_normal.jpg?width=200',
    description: '1-Sentence-Summary: The 5 AM Club helps you get up at 5 AM every morning, build a morning routine, and make time for the self-improvement you need to find success.',
    isEbook: true,
    isAudioBook: false,
  ),
  const Book(
      title: "The Age of Innocence",
      author: "Edith Wharton",
      imageUrl: "https://newcdn.fidibo.com/images/books/393_49632_normal.jpg?width=200",
      description: 'The Age of Innocence is a 1920 novel by American author Edith Wharton. It was her eighth novel, and was initially serialized in 1920 in four parts, in the magazine Pictorial Review. Later that year, it was released as a book by D. Appleton & Company. It won the 1921 Pulitzer Prize for Fiction, making Wharton the first woman to win the prize.',
      isEbook: false,
      isAudioBook: true,
  ),

  const Book(
      title: "Gone With the Wind",
      author: "Margaret Mitchell",
      imageUrl: "https://newcdn.fidibo.com/images/books/144483_82589_normal.jpg?width=200",
      description: 'Set in the American South against the backdrop of the American Civil War and the Reconstruction era, the film tells the story of Scarlett O\'Hara (Vivien Leigh), the strong-willed daughter of a Georgia plantation owner, following her romantic pursuit of Ashley Wilkes (Leslie Howard), who is married to his cousin, ...',
      isEbook: true,
      isAudioBook: false,
  ),
];