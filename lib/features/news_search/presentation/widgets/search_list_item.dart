import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';
import 'package:project_aranzazu_v2/features/news_body/presentation/pages/news_detail.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchListItem extends StatefulWidget {
  final BuiltNews news;
  SearchListItem(this.news);

  @override
  _SearchListItemState createState() => _SearchListItemState();
}

class _SearchListItemState extends State<SearchListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    NewsDetailPage(news: widget.news)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Hero(
              tag: "article_${widget.news.id}_${widget.news.date}",
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: widget.news.thumbnail,
                placeholder: (context, url) =>
                    Center(child: new CircularProgressIndicator()),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: "article_${widget.news.id}_${widget.news.title}",
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      widget.news.title,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  widget.news.excerpt,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff737474)),
                ),
                SizedBox(height: 7.0),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        timeago.format(
                          DateTime.parse(widget.news.date),
                        ),
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 9.5,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff737474)),
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_vert,
                        color: Color(0xff737474),
                        size: 17,
                      )
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
