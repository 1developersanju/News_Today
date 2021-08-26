import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
// import 'package:share/share.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart';

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

class NewsTile extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, publishedAt;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      this.publishedAt,
      @required this.posturl});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: widget.posturl,
                    )));
      },
      child: Container(
          // margin: EdgeInsets.only(
          //   top: data.size.width * .03,
          // ),
          width: data.size.width,
          child: Container(
            child: Container(
              // padding: EdgeInsets.symmetric(
              //   horizontal: data.size.width * .02,
              // ),
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
                      print(widget.imgUrl);
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        final data = MediaQuery.of(context);
                        return Scaffold(
                          appBar: AppBar(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                "News"
                                    .text
                                    .size(data.size.width * .05)
                                    .makeCentered(),
                                "Today"
                                    .text
                                    .size(data.size.width * .06)
                                    .yellow400
                                    .makeCentered(),
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
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: PinchZoomImage(
                              image: Image.network(
                                widget.imgUrl,
                                height: data.size.height * .40,
                                width: data.size.width,
                                fit: BoxFit.fill,
                              ),
                              zoomedBackgroundColor: Colors.black,
                              hideStatusBarWhileZooming: false,
                            ),
                          ),
                        );
                      }));
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: data.size.height * .40,
                      width: data.size.width,
                      child: Card(
                        color: Colors.transparent,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              widget.imgUrl,
                              height: data.size.height * .40,
                              width: data.size.width,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: data.size.height * .01,
                  ),
                  Text(
                    widget.title,
                    maxLines: 5,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: data.size.height * .030,
                        fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(
                  //   height: data.size.height * .01,
                  // ),
                  // Text(
                  //   widget.desc,
                  //   maxLines: 3,
                  //   style: TextStyle(
                  //     color: Colors.black54,
                  //     fontSize: data.size.height * .02,
                  //   ),
                  // ),
                  Spacer(),
                  Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        "News".text.size(data.size.width * .02).makeCentered(),
                        "Today"
                            .text
                            .size(data.size.width * .03)
                            .yellow400
                            .makeCentered(),
                      ],
                    ),
                    Container(
                      height: data.size.height * .07,
                      width: data.size.width,
                      child: HStack([
                        Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                print("like article");
                              },
                              child: Container(
                                width: data.size.width / 3,
                                child: Card(
                                  shadowColor: Colors.black,
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.thumb_up_alt,
                                      color: Colors.cyan.shade300,
                                      size: data.size.width / 17,
                                    ).centered().p2(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    //icon
                                    // Image.asset("assets/share.png",
                                    //         color: Colors.cyan.shade300)
                                    //     .p2(),
                                    Text("like",
                                        style: TextStyle(
                                          color: Colors.cyan.shade300,
                                          fontWeight: FontWeight.w600,
                                          fontSize: data.size.width / 20,
                                        )).p4()
                                  ]),
                                ),
                              ),
                            )),
                        Spacer(),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                              onTap: () {
                                // print("share article");
                              },
                              child: Container(
                                width: data.size.width / 3,

                                child: Card(
                                  shadowColor: Colors.black,
                                  child: Row(children: <Widget>[
                                    Image.asset("assets/share.png",
                                            color: Colors.cyan.shade300)
                                        .p2(),
                                    Text("share",
                                        style: TextStyle(
                                          color: Colors.cyan.shade300,
                                          fontWeight: FontWeight.w600,
                                          fontSize: data.size.width / 20,
                                        )).p4()
                                  ]),
                                ),
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //   image: AssetImage("assets/share.png"),
                                // )),
                              ),
                            )),
                      ]),
                    ),
                  ]),
                ],
              ),
            ),
          )),
    );
  }
}
