import 'package:flutter/material.dart';
import 'package:libellum/state/app_state.dart';

import 'package:libellum/theme.dart';
import 'package:libellum/screens/home.dart';
import 'package:libellum/screens/add_book.dart';
import 'package:libellum/screens/books_list.dart';
import 'package:scoped_model/scoped_model.dart';

final String appTitle = 'Libellum';

class Libellum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        title: appTitle,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeRoute(),
          '/books': (context) => BooksListRoute(),
          '/books/add': (context) => AddBookRoute(),
        });
  }
}

void main() {
  runApp(ScopedModel<AppModel>(
    model: AppModel(),
    child: Libellum(),
  ));
}
