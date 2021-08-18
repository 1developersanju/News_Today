import 'package:flutter/material.dart';
import 'package:news_app_api/helper/outside_india/catagory_news_outside_india.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
//  bool _loading;
  List<CategorieModel> categories = [];

  @override
  void initState() {
    //  _loading = true;
    super.initState();

    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.cyan.shade300,
              elevation: 20,
              child: Container(
                child: Column(
                  children: <Widget>[
                    /// Categories
                    Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          "International"
                              .text
                              .yellow400
                              .size(data.size.height * .03)
                              .makeCentered(),
                          "News"
                              .text
                              .size(data.size.height * .03)
                              .white
                              .makeCentered(),
                        ],
                      ),
                      "Categories"
                          .text
                          .size(data.size.height * .02)
                          .white
                          .makeCentered(),
                    ]),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      height: data.size.height,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          addAutomaticKeepAlives: false,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageAssetUrl: categories[index].imageAssetUrl,
                              categoryName: categories[index].categorieName,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews_outside_india(
                      newsCategory: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 200,
                width: data.size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              width: data.size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
