import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libellum/state/app_state.dart';

class AddBookForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddBookFormState();
  }
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  final bookTitleController = TextEditingController();
  final bookPageCountController = TextEditingController();

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
              controller: bookPageCountController,
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
            onPressed: () async {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                var newBook = await AppModel.of(context).addBook(bookTitleController.text, int.tryParse(bookPageCountController.text) ?? 0);
                print(newBook.toString());
                Navigator.pop(context);
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
