import 'package:flutter/material.dart';
import '../models/book.dart';
import '../data/bookmark_store.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Author: ${book.author}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(book.description ?? 'No Description'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final exists = BookmarkStore.bookmarks.any(
                      (b) => b.id == book.id,
                );

                if (!exists) {
                  BookmarkStore.bookmarks.add(book);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Book bookmarked'),
                  ),
                );
              },
              child: const Text('Bookmark'),
            ),
          ],
        ),
      ),
    );
  }
}