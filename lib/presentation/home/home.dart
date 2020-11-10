import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean/data/remote/news_colombia_api.dart';
import 'package:flutter_clean/data/remote/news_es_api.dart';
import 'package:flutter_clean/data/repository/data_catgory_repostory.dart';
import 'package:flutter_clean/domain/entities/category.dart';
import 'package:flutter_clean/presentation/widgets/category_burble.dart';
import 'package:flutter_clean/presentation/widgets/colombia_card.dart';
import 'package:flutter_clean/presentation/widgets/news_es.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _loading;
  var newscollist;
  var newsEsList;

  List<Category> category = List<Category>();

  void getCategory() async {
    DataCategoryModel categoryModel = DataCategoryModel();
    await categoryModel.getCategory();
    category = categoryModel.category;
    setState(() {
      _loading = false;
    });
  }

  void getNewsColombia() async {
    NewsColombia newsCol = NewsColombia();
    await newsCol.getNewsColombia();
    newscollist = newsCol.newsCol;
    setState(() {
      _loading = false;
    });
  }

  void getNewsEs() async {
    NewsEsApi newsEs = NewsEsApi();
    await newsEs.getNewsEs();
    newsEsList = newsEs.newsEs;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getCategory();
    getNewsEs();
    getNewsColombia();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(),
        appBar: AppBar(
          title: Text('Flutter News'),
        ),
        body: (_loading = false)
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            return CategoryBurble(
                              imageUrl: category[index].imageUrl,
                              categoryName: category[index].categoryName,
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(right: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newscollist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ColombiaCard(
                              urlToImage: newscollist[index].urlToImage ?? "",
                              title: newscollist[index].title ?? "",
                              articleUrl: newscollist[index].articleUrl ?? "",
                              author: newscollist[index].author ?? "",
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: newsEsList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsEs(
                              urlToImage: newsEsList[index].urlToImage ?? "",
                              title: newsEsList[index].title ?? "",
                              articleUrl: newsEsList[index].articleUrl ?? "",
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
