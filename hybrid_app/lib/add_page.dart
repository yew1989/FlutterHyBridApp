import 'package:flutter/material.dart';
import 'package:hybrid_app/book.dart';
import 'package:hybrid_app/public_tool.dart';
import 'package:hybrid_app/share.dart';

class AddPage extends StatefulWidget {
  final bool isAdd;
  final Book book;
  final int index;
  AddPage(this.isAdd,{this.book,this.index});
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
   var _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController webController = TextEditingController();

  bool _checkInput() {
    var name = nameController.text;
    var url = webController.text;
    if(name.length == 0) {
      showAlertViewSingle(context,'提示','请输入备注',null);
      return false;
    }
    if(url.length == 0) {
      showAlertViewSingle(context,'提示','请输入网址',null);
      return false;
    }
    return true;
  }

  void saveToShare(){
    var name = nameController.text;
    var url = webController.text;
    if(_checkInput() == false) return;
    if(widget.isAdd) {
      var book = Book(name, '', addHttp(url));
      ShareManager.instance.books.add(book);
      ShareManager.instance.saveBookData();
    }
    else{
      var book = Book(name, '', addHttp(url));
      ShareManager.instance.books[widget.index] = book;
      ShareManager.instance.saveBookData();
    }
    popPage();
  }

  void popPage(){
    final snackBar = SnackBar(content: Text((widget.isAdd ?'新增':'修改') +'成功 !'));
    _scaffoldkey.currentState.showSnackBar(snackBar);
    Future.delayed(Duration(seconds: 1),(){
      Navigator.of(context).pop();
    });
  }

  String addHttp(String raw){
    var last = '';
    if(raw.length == 0) return '';
    last = raw.trim();

    if(raw.startsWith('http://')) {
      last = raw;
      return last;
    }

    last = 'http://' + raw;
    return last;
  }

  @override
  void initState() {
    super.initState();
    if(widget.isAdd == false){
      nameController.text =  widget.book.name;
      webController.text  =  widget.book.demoUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(widget.isAdd ?'新增':'修改'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '备注',
                  hintText: '请输入备注', 
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: webController,
                decoration: InputDecoration(
                  labelText: '网址',
                  hintText: '请输入网址', 
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 40,
                width: double.infinity,
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(widget.isAdd ?'新增':'修改',style: TextStyle(color: Colors.white,fontSize: 16)),
                  onPressed: (){
                    saveToShare();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}