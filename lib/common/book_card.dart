import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libellum/models/books.dart';

class BookCard extends StatelessWidget {
  BookCard({this.book});

  final Book book;

  void _showLogDialog(context, bookPageCount) {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text('What page are you up to now?'),
          content: TextField(
            autofocus: true,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
                labelText: 'Page Number', hintText: 'max $bookPageCount'),
          ),
          actions: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Set'),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Ink.image(
            image: AssetImage('assets/images/book_cover.jpg'),
            fit: BoxFit.cover,
            width: 100,
            height: 150.0,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/books/show', arguments: book);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text("You've read - of ${book.pageCount} pages"),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton.icon(
                          onPressed: () {
                            _showLogDialog(context, book.pageCount);
                          },
                          icon: Icon(Icons.check),
                          label: Text('Log'),
                          color: Colors.green),
                      FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                        label: Text('Not Today'),
                        color: Colors.red,
                      )
                    ],
                  ),
                  Divider(),
                  LinearProgressIndicator(value: 0.4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
