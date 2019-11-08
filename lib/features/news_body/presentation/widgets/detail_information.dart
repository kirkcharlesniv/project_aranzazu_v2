import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailInformation extends StatelessWidget {
  final BuiltNews news;
  const DetailInformation({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: "article_${news.id}_${news.title}",
                transitionOnUserGestures: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    news.title,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 10),
                child: SizedBox(
                  width: 34,
                  height: 3.5,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 25,
                      height: 25,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: news.authorImage,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "By",
                            style: TextStyle(
                                color: Color(0xff8E8E8E), fontSize: 9),
                          ),
                          Text(
                            " ${news.authorName}",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                      Text(
                        timeago.format(DateTime.parse(news.date)),
                        style: TextStyle(
                            color: Color(0xff8E8E8E),
                            fontSize: 7,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
