import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/news.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:news_app_api/models/categorie_model.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            "News".text.size(20).makeCentered(),
            "Today".text.size(25).yellow400.makeCentered(),
          ],
        ),
        actions: <Widget>[
          // opacity: 0,
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.list,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: _loading
          ? Center(
              child: Card(
                child: Container(
                  child: CircularProgressIndicator().p12(),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: TikTokStyleFullPageScroller(
                          animationDuration: const Duration(milliseconds: 400),
                          swipePositionThreshold: 0.500,
                          contentSize: newslist.length,
                          builder: (context, index) {
                            return Card(
                              color: Colors.cyan.shade300,
                              child: NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              ).p8(),
                            ).p2();
                          }),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
