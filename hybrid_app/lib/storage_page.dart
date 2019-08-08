import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_app/book.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {

  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    initBooks();
  }

  void initBooks(){
    books
    ..add(Book(
      '天气动画',
      '',
      ''))
    ..add(Book(
      '金币掉落',
      '',
      ''))
    ..add(Book(
      'GIS地图',
      '',
      ''))
    ..add(Book(
      'AI雨情',
      '',
      ''))
    ..add(Book(
      '仪表盘',
      '',
      ''))
    ..add(Book(
      '历史曲线',
      '',
      ''))
    ;

  }

  Widget gridTile(BuildContext ctx,int idx){
    var book = books[idx];
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
               Expanded(
                  flex: 1,
                  child: Center(child: Text('${book.name}')),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('储备'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
        ),
        itemCount: books.length,
        itemBuilder: (ctx,idx) => gridTile(ctx,idx),
      ),
    );
  }
}