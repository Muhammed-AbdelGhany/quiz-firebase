// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    this.status,
    this.message,
    this.result,
  });

  int status;
  String message;
  List<Result> result;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.catId,
    this.catName,
    this.catImage,
    this.catDate,
    this.catStatus,
  });

  String catId;
  String catName;
  String catImage;
  DateTime catDate;
  String catStatus;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        catId: json["cat_id"],
        catName: json["cat_name"],
        catImage: json["cat_image"],
        catDate: DateTime.parse(json["cat_date"]),
        catStatus: json["cat_status"],
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_name": catName,
        "cat_image": catImage,
        "cat_date": catDate.toIso8601String(),
        "cat_status": catStatus,
      };
}
