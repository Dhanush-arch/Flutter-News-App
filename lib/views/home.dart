import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_models.dart';
import 'package:flutter_news/models/category_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_news/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;
  bool _darkMode = false;

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.blue,
      primaryColor: Colors.white,
      backgroundColor: Colors.white);

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter news',
      debugShowCheckedModeBanner: false,
      theme: _darkMode
          ? ThemeData(brightness: Brightness.dark, accentColor: Colors.blue)
          : _lightTheme,
      home: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              title: Text("Dark Mode"),
              trailing: Switch(
                  value: _darkMode,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.lightBlue,
                  onChanged: (state) {
                    setState(() {
                      _darkMode = state;
                    });
                  }),
            ),
          ],
        )),
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
              ),
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
                      // Categories
                      Container(
                        height: 70,
                        padding: EdgeInsets.only(top: 6),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return Tile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                                darkTheme: _darkMode,
                              );
                            }),
                      ),
                      // Blog
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
                                url: articles[index].url,
                                darkTheme: _darkMode ? true : false,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final imageUrl, categoryName;
  final bool darkTheme;
  Tile({this.imageUrl, this.categoryName, this.darkTheme});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategorynNews(
                      category: widget.categoryName.toString().toLowerCase(),
                      darkTheme: widget.darkTheme,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(right: 6),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, url;
  final bool darkTheme;
  BlogTile({this.imageUrl, this.title, this.desc, this.url, this.darkTheme});

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleView(blogUrl: widget.url)));
        },
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(widget.imageUrl)),
              Padding(
                padding:
                    const EdgeInsets.only(top: 9, left: 9, right: 9, bottom: 4),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.darkTheme ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.only(top: 4, left: 9, right: 9, bottom: 9),
                child: Text(
                  widget.desc,
                  style: TextStyle(
                    color: widget.darkTheme ? Colors.white60 : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
