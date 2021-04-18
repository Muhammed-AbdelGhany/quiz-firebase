import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:quiz_firebase/test%20models/books.dart';

class Service {
  List<Result> booksList = [];
  Future<void> getBooksData() async {
    final baseUrl = 'https://darelkotob.net/index.php/api/categorylist';
    Response response = await Dio().get(baseUrl, options: Options(
      validateStatus: (status) {
        return status <= 500;
      },
    ));
    Books booksData = new Books.fromJson(response.data);
    booksList = booksData.result;
    print(booksList);
    print('in service');
  }
}
