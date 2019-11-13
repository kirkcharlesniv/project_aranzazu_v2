import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';

class DetailAppBar extends StatelessWidget {
  final BuiltNews news;
  const DetailAppBar({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(news.title),
      backgroundColor: Colors.green,
      expandedHeight: 200,
      snap: true,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: "article_${news.id}_${news.date}",
          child: CachedNetworkImage(
            imageUrl: news.thumbnail,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
