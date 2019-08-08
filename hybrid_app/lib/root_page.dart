import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_app/book_page.dart';
import 'package:hybrid_app/home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: Colors.white70,
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(title: Text("自定义"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Text("参考"), icon: Icon(Icons.book)),
            // BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.account_box)),
          ],
        ),
        resizeToAvoidBottomInset:true,
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return BookPage();
                break;
              // case 2:
              //   return Container();
              //   break;
               }
            },
          );
        }
    );
  }
}