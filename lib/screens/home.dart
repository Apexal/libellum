import 'package:flutter/material.dart';
import 'package:libellum/common/bottom_bar.dart';

import 'package:libellum/main.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: null
      ),
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
