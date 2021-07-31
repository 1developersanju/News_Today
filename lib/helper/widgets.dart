import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

Widget MyAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        "News".text.size(20).makeCentered(),
        "Today".text.size(25).yellow400.makeCentered(),
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, publishedAt;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      this.publishedAt,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
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
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ))
                            ],
                            backgroundColor: Colors.black,
                            elevation: 0.0,
                          ),
                          //backgroundColor: Colors.black,
                          body: Container(
                            // The blue background emphasizes that it's a new route.
                            color: Colors.black,
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: PinchZoomImage(
                              image: Image.network(
                                imgUrl,
                                height: MediaQuery.of(context).size.width / 1.5,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                              zoomedBackgroundColor: Colors.black,
                              hideStatusBarWhileZooming: false,
                            ),
                          ),
                        );
                      }));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imgUrl,
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 3,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      "News".text.size(10).makeCentered(),
                      "Today".text.size(15).yellow400.makeCentered(),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
