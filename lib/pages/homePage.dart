import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ztm/controllers/newsController.dart';
import 'package:ztm/pages/newsPage.dart';
import 'package:ztm/widgets/newsCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 243, 253),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pngwing.com(3).png',
                height: 120,
                width: 120,
              )
            ],
          ),
        ),
        body: Obx(
          () => newsController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailsPage(
                      title: newsController.newsArticle[index].title ?? "",
                          description:
                              newsController.newsArticle[index].description ??
                                  "",
                          imageUrl:
                              newsController.newsArticle[index].urlToImage ??
                                  "",
                          // url: newsController.newsArticle[index].url?? "",
                          publishedAt: newsController
                                  .newsArticle[index].publishedAt
                                  .toString() ??
                              "",
                          //source: newsController.newsArticle[index].source?.name?? "",
                          author:
                              newsController.newsArticle[index].author ?? "",
                          
                          content:
                              newsController.newsArticle[index].content ?? "",

                    ),
                  ),
                ),
                        child: Newscard(
                          title: newsController.newsArticle[index].title ?? "",
                          description:
                              newsController.newsArticle[index].description ??
                                  "",
                          imageUrl:
                              newsController.newsArticle[index].urlToImage ??
                                  "",
                          // url: newsController.newsArticle[index].url?? "",
                          publishedAt: newsController
                                  .newsArticle[index].publishedAt
                                  .toString() ??
                              "",
                          //source: newsController.newsArticle[index].source?.name?? "",
                          author:
                              newsController.newsArticle[index].author ?? "",
                        ),
                      ),
                  separatorBuilder: ((context, index) => SizedBox()),
                  itemCount: newsController.newsArticle.length),
        ));
  }
}
