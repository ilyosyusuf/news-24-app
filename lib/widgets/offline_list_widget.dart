import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsprogroup/models/news_model.dart';

class OfflineListWidget extends StatefulWidget {
  List<Box<Article>> futures;
  int current;
  int i;
  OfflineListWidget(
      {Key? key, required this.futures, required this.current, required this.i})
      : super(key: key);

  @override
  State<OfflineListWidget> createState() => _OfflineListWidgetState();
}

class _OfflineListWidgetState extends State<OfflineListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(widget
                      .futures[widget.current]
                      .getAt(widget.i)!
                      .urlToImage
                      .toString()),
                  fit: BoxFit.cover),
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
                    widget.futures[widget.current]
                        .getAt(widget.i)!
                        .title
                        .toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Text(
                    "By ${widget.futures[widget.current].getAt(widget.i)!.author.toString()}",
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
                              Text(widget.futures[widget.current]
                                  .getAt(widget.i)!
                                  .source!
                                  .name
                                  .toString()),
                              Icon(Icons.more_horiz),
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
    );
  }
}
