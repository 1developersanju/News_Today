import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/views/categorie_news.dart';
import 'package:news_app_api/views/categoryView.dart';
import '../helper/news.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading;
  var newslist;

  List<CategorieModel> categories = [];

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.black,
      body: PageView(
        children: <Widget>[
          DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text('Tap back again to leave'),
            ),
            child: SafeArea(
              child: _loading
                  ? Center(
                      child: Card(
                        child: Container(
                          child: CircularProgressIndicator().p12(),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            /// Categories
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 70,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return CategoryCard(
                                      imageAssetUrl:
                                          categories[index].imageAssetUrl,
                                      categoryName:
                                          categories[index].categorieName,
                                    );
                                  }),
                            ),

                            /// News Article
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              color: Colors.black,
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  child: TikTokStyleFullPageScroller(
                                      animationDuration:
                                          const Duration(milliseconds: 400),
                                      swipePositionThreshold: 0.500,
                                      contentSize: newslist.length,
                                      builder: (context, index) {
                                        return Card(
                                          color: Colors.cyan.shade300,
                                          child: NewsTile(
                                            imgUrl:
                                                newslist[index].urlToImage ??
                                                    "",
                                            title: newslist[index].title ?? "",
                                            desc: newslist[index].description ??
                                                "",
                                            content:
                                                newslist[index].content ?? "",
                                            posturl:
                                                newslist[index].articleUrl ??
                                                    "",
                                          ).p8(),
                                        ).p2();
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          ////category page
          CategoryList()
        ],
        scrollDirection: Axis.horizontal,
        pageSnapping: false,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
