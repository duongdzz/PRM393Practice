import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_detail_page.dart';

class BookmarkPage extends StatelessWidget {
  final List<Book> bookmarks;

  const BookmarkPage({
    super.key,
    required this.bookmarks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: bookmarks.isEmpty
          ? const Center(
        child: Text('No bookmarked books'),
      )
          : ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          final book = bookmarks[index];

          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookDetailPage(
                    book: book,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}