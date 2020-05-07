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
        builder: (context, child, model) => ListView.builder(
          itemCount: model.books.length,
          itemBuilder: (context, index) {
              var book = model.books.elementAt(index);

              return ListTile(
                onTap: () {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('Tapped ${book.title}')));
                  
                  model.removeBook(book);
                },
                leading: Icon(Icons.book),
                trailing: Text(book.pageCount.toString() + ' pages', style: Theme.of(context).textTheme.subtitle,),
                title: Text(book.title,)
              );
            },
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 1),
    );
  }
}
