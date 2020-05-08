import 'package:flutter/material.dart';
import 'package:libellum/common/bottom_bar.dart';
import 'package:libellum/state/app_state.dart';
import 'package:scoped_model/scoped_model.dart';

class BooksListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      body: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => GridView.count(
                crossAxisCount: 2,
                children: List.generate(model.books.length, (index) {
                  final book = model.books.elementAt(index);

                  return Center(
                    child: Stack(
                      children: <Widget>[
                        Image.asset('assets/images/book_cover.jpg'),
                        Text(
                          book.title,
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              )),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 1),
    );
  }
}
