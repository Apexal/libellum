import 'package:flutter/material.dart';
import 'package:libellum/common/book_card.dart';
import 'package:libellum/common/bottom_bar.dart';

import 'package:libellum/main.dart';
import 'package:libellum/state/app_state.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              ScopedModelDescendant<AppModel>(
                builder: (context, child, model) {
                  if (model.books.length == 0) {
                    return Text('No books!');
                  }
                  return BookCard(book: model.books.first);
                },
              )
            ],
          )),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/books/add');
          },
          child: Icon(Icons.add),
        );
      }),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 0),
    );
  }
}
