import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBookForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddBookFormState();
  }
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  final bookTitleController = TextEditingController();
  final bookPageCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
              controller: bookTitleController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Book Title', icon: Icon(Icons.title))),
          TextFormField(
              controller: bookPageCount,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Page Count', icon: Icon(Icons.library_books))),
          RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Navigator.pop(context, {
                  'bookTitle': bookTitleController.text,
                  'bookPageCount': bookPageCount.text,
                });
              }
            },
            child: Text('Submit'),
          )
          // Add TextFormFields and RaisedButton here.
        ]));
  }
}

class AddBookRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Book'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: AddBookForm(),
      ),
    );
  }
}
