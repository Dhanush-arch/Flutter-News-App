import "package:flutter/material.dart";
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_models.dart';
import 'package:flutter_news/views/home.dart';

class CategorynNews extends StatefulWidget {
  final String category;
  CategorynNews({this.category});

  @override
  _CategorynNewsState createState() => _CategorynNewsState();
}

class _CategorynNewsState extends State<CategorynNews> {
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
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
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 10, right: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: articles.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: articles[index].imageUrl,
                                title: articles[index].title,
                                desc: articles[index].desc,
                                url: articles[index].url);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
