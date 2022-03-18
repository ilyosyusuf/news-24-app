import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/screens/detail_page.dart';
import 'package:newsprogroup/service/apple_service.dart';
import 'package:newsprogroup/service/business_service.dart';
import 'package:newsprogroup/service/domain_service.dart';
import 'package:newsprogroup/service/news_service.dart';
import 'package:newsprogroup/service/tech_service.dart';
import 'package:newsprogroup/widgets/second_app_bar.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({Key? key}) : super(key: key);

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  NewsModel? newsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: MySecondAppbar(title: "BookMarked"),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/gifs/loading.gif',
                            image: AppleService.myBox21!
                                .getAt(i)!
                                .urlToImage
                                .toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 270,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppleService.myBox21!
                                      .getAt(i)!
                                      .title
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                Text(
                                  "By ${AppleService.myBox21!.getAt(i)!.author}",
                                  style: TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 220,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(AppleService.myBox21!
                                                .getAt(i)!
                                                .source!
                                                .name
                                                .toString()),
                                            IconButton(
                                              icon: Icon(
                                                Icons.more_horiz,
                                              ),
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: AppleService.myBox21!.length,
            ),
          ),
        ),
      ],
    );
  }
}
