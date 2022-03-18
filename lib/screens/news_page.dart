import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/screens/detail_page.dart';
import 'package:newsprogroup/service/apple_service.dart';
import 'package:newsprogroup/service/business_service.dart';
import 'package:newsprogroup/service/domain_service.dart';
import 'package:newsprogroup/service/news_service.dart';
import 'package:newsprogroup/service/tech_service.dart';
import 'package:newsprogroup/widgets/app_bar_widget.dart';
import 'package:newsprogroup/widgets/elevatedbutton.dart';
import 'package:newsprogroup/widgets/news_list_widget.dart';
import 'package:newsprogroup/widgets/offline_list_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final Connectivity _connectivity = Connectivity();
  bool isConnected = false;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String? status;
  int current = 0;
  List _cat = ["Tesla", "Apple", "Business", "Domains", "Technology"];
  List<Box<Article>> futures = [
    NewsService.myBox1 as Box<Article>,
    AppleService.myBox2 as Box<Article>,
    BusinessService.myBox3 as Box<Article>,
    DomainService.myBox4 as Box<Article>,
    TechService.myBox5 as Box<Article>,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    clearAll();
  }

  static bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: MyAppbar.myAppbar,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 5.0, left: 10.0),
          child: SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return MyElevetedButton(
                      currentPage: current,
                      onpressed: () {
                        setState(
                          () {
                            current = i;
                          },
                        );
                      },
                      text: _cat[i],
                      index: i);
                },
                itemCount: _cat.length,
              )),
        ),
        Expanded(
          flex: 10,
          child: isConnected
              ? FutureBuilder(
                  future: Future.wait(
                    [
                      NewsService.getData(),
                      AppleService.getData(),
                      BusinessService.getData(),
                      DomainService.getData(),
                      TechService.getData(),
                    ],
                  ),
                  builder: (context, AsyncSnapshot<List<NewsModel>> snap) {
                    if (!snap.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.blue,
                        ),
                      );
                    } else if (snap.hasError) {
                      return const Center(
                        child: Text("NoData"),
                      );
                    } else {
                      var data = snap.data!;
                      return ListView.builder(
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FadeInLeft(
                                child: NewsListWidget(
                                  newsModel: data[current],
                                  index: i,
                                  isTrue: isTrue,
                                ),
                              ),
                          );
                        },
                        itemCount: data[current].articles!.length,
                      );
                    }
                  },
                )
              : NewsService.myBox1!.isNotEmpty?
              SizedBox(
                width: double.infinity,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: FadeInLeftBig(
                                child: OfflineListWidget(
                                    futures: futures, current: current, i: i),
                              ),
                            ),
                          );
                        },
                        itemCount: futures[current].length,
                      ),
                    )
                  : const Center(
                      child: Text("No Internet"),
                    ),
        ),
      ],
    );
  }

  check() async {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        isConnected = true;
        setState(() {});
      } else {
        isConnected = false;
        setState(() {});
      }
    });
  }
  
  clearAll(){
    NewsService.myBox1!.clear();
    AppleService.myBox2!.clear();
    BusinessService.myBox3!.clear();
    DomainService.myBox4!.clear();
    TechService.myBox5!.clear();
  }

    @override
  void dispose() {
    // TODO: implement dispose
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
