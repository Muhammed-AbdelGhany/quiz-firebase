import 'package:flutter/material.dart';
import 'package:quiz_firebase/test%20models/books.dart';
import 'package:quiz_firebase/test%20service/service.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Result> booksData = [];

  getbooksData() async {
    Service service = new Service();
    await service.getBooksData();
    booksData = service.booksList;
    // print(booksData[1]);
    //print('in view');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getbooksData(),
      builder: (context, snapshot) {
        return Scaffold(
          body: ListView.builder(
              itemCount: booksData.length,
              itemBuilder: (ctx, i) {
                return Text(booksData[i].catName);
              }),
        );
      },
    );
  }
}
