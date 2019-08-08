import 'package:flutter/material.dart';
import 'package:hybrid_app/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareManager {
 
  List<Book> books = List<Book>();

  factory ShareManager() =>_getInstance();
  static ShareManager get instance => _getInstance();

  static ShareManager _instance;

  ShareManager._internal() {
    books = [];
    debugPrint('单例初始化OK');
  }
  
  static ShareManager _getInstance() {
    if (_instance == null) {
      _instance =  ShareManager._internal();
    }
    return _instance;
  }

  void saveBookData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   var books = ShareManager.instance.books;
   var bookData = BookData(books: books);
   var bookDataStr = bookData.toJson();
   await prefs.setString('BookData',bookDataStr);
  }

  Future<void> loadBookData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var bookDataStr = prefs.getString('BookData');
    var bookData =  BookData.fromJson(bookDataStr);
    ShareManager.instance.books = bookData.books ?? [];
  }


}