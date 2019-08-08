import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hybrid_app/book.dart';
import 'package:hybrid_app/webview_page.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    initBooks();
  }

  void initBooks(){
    books

    ..add(Book(
      'Baidu',
      'https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top_86d58ae1.png',
      'https://www.baidu.com'))

    ..add(Book(
      'Vant',
      'https://img.yzcdn.cn/public_files/2017/12/18/fd78cf6bb5d12e2a119d0576bedfd230.png',
      'https://youzan.github.io/vant/mobile.html#/zh-CN/'))

    ..add(Book(
      'Muse-UI',
      'https://muse-ui.org/img/icon_logo.a76a122f.png',
      'https://muse-ui.org/#/zh-CN/grid'))

    ..add(Book(
      'VUX',
      'https://camo.githubusercontent.com/f5f777a9940131ae649e1a38abd3b2926aa6e342/68747470733a2f2f692e6c6f6c692e6e65742f323031372f31312f32302f356131323138376562663265302e706e67',
      'https://vux.li/demos/v2/?x-page=github#/demo'))


          ..add(Book(
      'YDUI',
      'http://mhsa.fjlead.com/Content/images/144.png',
      'http://m.ydui.org'))

          ..add(Book(
      'vonic',
      'http://mhsa.fjlead.com/Content/images/144.png',
      'https://wangdahoo.github.io/vonic-documents/demo/vuex/counter.html#/'))

          ..add(Book(
      'Mint-UI',
      'https://avatars2.githubusercontent.com/u/12810740?s=200&v=4',
      'http://mint-ui.github.io/docs/#/zh-cn2'))

          ..add(Book(
      'we-vue',
      'https://wevue.org/images/logo.png',
      'https://demo.wevue.org'))

          ..add(Book(
      'cube-ui',
      'https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/pic/item/c2fdfc039245d6888751ea5eaac27d1ed31b24fc.jpg',
      'https://didi.github.io/cube-ui/example/#/'))

                ..add(Book(
      'Mand Mobile',
      'http://mhsa.fjlead.com/Content/images/144.png',
      'https://didi.github.io/mand-mobile/examples'))


                    ..add(Book(
      'Frozen-ui',
      'http://frozenui.github.io/assets/img/logo.png',
      'http://ryanbay.cn/vipstyle/qui/2.0.0/demo/html/index.html'))


       ..add(Book(
      'Ant Design Mobile',
      'https://camo.githubusercontent.com/a717488dab48dea50d4d2fb3fe8977b0a4f29147/68747470733a2f2f7a6f732e616c697061796f626a656374732e636f6d2f726d73706f7274616c2f77496a4d446e7372446f50506349562e706e67',
      'http://mobile.ant.design/kitchen-sink/'))

      ..add(Book(
      'SUI-Mobile',
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565175487703&di=7f967e1390d9a8c911f4e2e546126966&imgtype=0&src=http%3A%2F%2F7.pic.pc6.com%2Fthumb%2Fup%2F2013-8%2F201381151059_600_0.png',
      'http://m.sui.taobao.org/demos/'))

      //  ..add(Book(
      // 'Amaze UI',
      // 'https://secure.gravatar.com/avatar/951ae56f023539752f4db7d3ce1cccfc?s=72',
      // 'https://didi.github.io/mand-mobile/examples'))

       ..add(Book(
      'Framework7',
      'http://mhsa.fjlead.com/Content/images/144.png',
      'http://framework7.taobao.org/apps/'))


      
    ;

  }

  Widget gridTile(BuildContext ctx,int idx){
    var book = books[idx];
    return GestureDetector(
      onTap: (){
        Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
          builder: (ctx) => WebViewPage(book),
        ));
      },
      child: Container(
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "${book.img}",
                          placeholder: (context, url) =>  Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>  Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10),
               Expanded(
                  flex: 1,
                  child: Text('${book.name}'),
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
        title: Text('参考'),
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