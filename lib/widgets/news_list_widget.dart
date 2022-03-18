import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/screens/detail_page.dart';
import 'package:newsprogroup/service/apple_service.dart';

class NewsListWidget extends StatefulWidget {
  NewsModel newsModel;
  int index;
  bool isTrue;
  NewsListWidget(
      {Key? key,
      required this.newsModel,
      required this.index,
      required this.isTrue})
      : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  Color bookmarkColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((ctx) => DetailPage(
                    news: widget.newsModel.articles![widget.index]))));
        setState(() {});
      },
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
                image: widget.newsModel.articles![widget.index].urlToImage ??
                    'https://source.unsplash.com/random',
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
                      widget.newsModel.articles![widget.index].title.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Text(
                      "By ${widget.newsModel.articles![widget.index].author}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.newsModel.articles![widget.index]
                                    .source!.name
                                    .toString()),
                                IconButton(
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: bookmarkColor,
                                  ),
                                  onPressed: () {
                                    widget.isTrue = !widget.isTrue;
                                    if (widget.isTrue == true) {
                                      AppleService.myBox21!.add(widget
                                          .newsModel.articles![widget.index]);
                                      AppleService.myTrue!.add(true);
                                      bookmarkColor = Colors.black;
                                      // AppleService.myBox21!.clear();
                                      setState(() {});
                                    } else {
                                      AppleService.myBox21!
                                          .deleteAt(widget.index);
                                      bookmarkColor = Colors.grey;
                                      setState(() {});
                                    }
                                  },
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
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  check(){
    for (var i = 0; i < widget.newsModel.articles!.length; i++) {
      if (widget.isTrue == true) {
        bookmarkColor = Colors.black;
        setState(() {});
      }
    }
  }
}