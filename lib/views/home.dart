import 'package:flutter/material.dart';
import 'package:news_today/models/category_model.dart';
import 'package:news_today/utility/data.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsHome extends StatefulWidget {
  //NewsHome({Key key}) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<CategoryModel> categories = [CategoryModel()];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          "News".text.size(20).makeCentered(),
          "Today".text.size(25).yellow400.makeCentered(),
        ]),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: VStack([
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCards(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  //const CategoryCards({Key key}) : super(key: key);
  final imageUrl, categoryName;
  CategoryCards({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
              child: Image.network(
            imageUrl,
            width: 120,
            height: 80,
            fit: BoxFit.fill,
          )),
          Container(
             width: 120,
            height: 80,
            color: Colors.black26,
            child: "$categoryName".text.yellow400.makeCentered(),
          )
        ],
      ),
    );
  }
}
