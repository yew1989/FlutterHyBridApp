import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_app/add_page.dart';
import 'package:hybrid_app/book.dart';
import 'package:hybrid_app/public_tool.dart';
import 'package:hybrid_app/share.dart';
import 'package:hybrid_app/webview_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Book> books = List<Book>();

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() async {
    await ShareManager.instance.loadBookData();
    books = ShareManager.instance.books;
    setState(() {
      
    });
  }

  void deleteBooks(int index){
    showAlertViewDouble(context,'提示','是否删除该页面入口',() => actionDelete(index));
  }

  void actionDelete(int index){
    books.removeAt(index);
    setState(() {});
    ShareManager.instance.books = books;
    ShareManager.instance.saveBookData();
  }
  
  void updateBooks(Book book,int index){
    Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
     builder: (ctx) => AddPage(false,book: book,index: index)));
  }

  void onPressAdd(){
    Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
     builder: (ctx) => AddPage(true)));
  }

    Widget gridTile(BuildContext ctx,int idx){
    var book = books[idx];
    return GestureDetector(
        onTap: (){
          Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
            builder: (ctx) => WebViewPage(book),
          ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Container(
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('${book.name}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                    ),
                   Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('${book.demoUrl}')),
                            SizedBox(width: 8),
                            FlatButton(
                              color: Colors.red,
                              child: Text('删除',style: TextStyle(color: Colors.white,fontSize: 12),),
                              onPressed: () => deleteBooks(idx),
                            ),
                            SizedBox(width: 8),
                            FlatButton(
                              color: Colors.blue,
                              child: Text('修改',style: TextStyle(color: Colors.white,fontSize: 12),),
                              onPressed: () => updateBooks(book,idx),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),
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
        title: Text('自定义'),
        actions: <Widget>[
          IconButton(
            onPressed: onPressAdd, 
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
        ),
        itemCount: books.length,
        itemBuilder: (ctx,idx) => gridTile(ctx,idx),
      ),
    );
  }
}