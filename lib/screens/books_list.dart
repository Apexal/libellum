import 'package:flutter/material.dart';
import 'package:libellum/common/bottom_bar.dart';
import 'package:libellum/models/books.dart';
import 'package:provider/provider.dart';

final int s = 12;

class BooksListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      body: Consumer<BooksModel>(
        builder: (context, bookList, child) {
          final books = bookList.books;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              var book = books.elementAt(index);

              return ListTile(
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tapped ${book.title}')));
                },
                title: Text(book.title,)
              );
            },
          );
        },
      ),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 1),
    );
  }
}
