import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_market_trading_app/News/Models/article_model.dart';
import 'package:stock_market_trading_app/News/views/article_view.dart';

import '../Models/category_model.dart';
import '../helper/data.dart';
import '../helper/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  Future<void> getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
          children: const <Widget>[
            Text(
              "Flutter",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "News",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
      :SingleChildScrollView(child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageUrl: categories[index].imageAssetUrl,
                  categoryName: categories[index].categorieName,
                );
              },
            )
          ),

          Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(itemCount: articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics( ),
            itemBuilder: (context,index){
              return BlogTile(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title,
                desc: articles[index].description,
                url: articles[index].url,
              );
            }),
          )
        ],
      ),),

    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl, width: 120, height: 60),
          Text(categoryName),
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc,url;
  BlogTile({required this.imageUrl,required this.title, required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(color: Colors.black54),)
          ],
        ),
      ),
    );
  }
}
