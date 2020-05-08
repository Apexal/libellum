import 'package:flutter/material.dart';
import 'package:libellum/models/books.dart';

class ShowBookRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Show Book'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text(
              book.title,
              style: Theme.of(context).textTheme.display1,
            ),
            Image.asset('assets/images/book_cover.jpg'),
            Row(children: <Widget>[
              Text('0'),
              Expanded(
                child: LinearProgressIndicator(value: 0.75),
              ),
              Text(book.pageCount.toString()),
            ]),
            ButtonBar(
              children: <Widget>[
                RaisedButton.icon(
                    color: Colors.green,
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    label: Text('Mark finished')),
                RaisedButton.icon(
                    color: Colors.red,
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    label: Text('Delete!'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
