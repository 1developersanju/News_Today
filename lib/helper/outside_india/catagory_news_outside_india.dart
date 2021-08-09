import 'package:flutter/material.dart';
import 'package:news_app_api/helper/outside_india/news_outside_india.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class CategoryNews_outside_india extends StatefulWidget {
  final String newsCategory;

  CategoryNews_outside_india({this.newsCategory});

  @override
  _CategoryNews_outside_indiaState createState() =>
      _CategoryNews_outside_indiaState();
}

class _CategoryNews_outside_indiaState
    extends State<CategoryNews_outside_india> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    NewsForCategory_outside_india news = NewsForCategory_outside_india();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
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
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  // getNews();
                },
                child: Icon(
                  Icons.list,
                  color: Colors.black,
                ),
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
                      height: data.size.height / 1.3,
                      child: TikTokStyleFullPageScroller(
                          animationDuration: const Duration(milliseconds: 400),
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
