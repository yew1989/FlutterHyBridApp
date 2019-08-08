import 'package:flutter/material.dart';
import 'package:hybrid_app/book.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final Book book;
  WebViewPage(this.book);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var isFinish = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.book.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close,color: Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              WebView(
                onPageFinished: (wb){
                  isFinish = true;
                  setState(() {
                  });
                },
                initialUrl: widget.book.demoUrl,
                javascriptMode:JavascriptMode.unrestricted,
                debuggingEnabled: false,
              ),
              Opacity(
                opacity: isFinish ? 0:1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('加载中',style:TextStyle(color:Colors.green,fontSize: 16)),
                      Text('请稍后',style:TextStyle(color:Colors.green,fontSize: 12)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
