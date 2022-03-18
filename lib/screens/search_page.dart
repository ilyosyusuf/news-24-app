import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/service/apple_service.dart';
import 'package:newsprogroup/service/business_service.dart';
import 'package:newsprogroup/service/domain_service.dart';
import 'package:newsprogroup/service/news_service.dart';
import 'package:newsprogroup/service/tech_service.dart';
import 'package:newsprogroup/widgets/elevatedbutton.dart';
import 'package:newsprogroup/widgets/news_list_widget.dart';
import 'package:newsprogroup/widgets/offline_list_widget.dart';
import 'package:newsprogroup/widgets/search_online_widget.dart';
import 'package:newsprogroup/widgets/second_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Connectivity _connectivity = Connectivity();
  bool isConnected = true;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String? status;
  int current = 0;
  List _cat = ["Tesla", "Apple", "Business", "Domains", "Technology"];
  TextEditingController _controller = TextEditingController();
  Set<Article> searchItem = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // key: UniqueKey(),
      children: [
        Container(
          width: double.infinity,
          child: MySecondAppbar(title: "Search"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5.0, left: 10.0),
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
                      return
                          Column(
                        children: [
                          SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (v) {
                                searchItem.clear();
                                for (var i = 0; i < data.length; i++) {
                                  if(v.length == 0){
                                    searchItem.clear();
                                    setState(() {});
                                  }else if(data[current].articles![i].title.toString().toLowerCase().contains(v.toString().toLowerCase())){
                                    searchItem.add(data[current].articles![i]);
                                    
                                    print(data[current].articles![i].title);
                                    setState(() {
                                    });
                                  }                  
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  itemBuilder: (context, i) {
                                    return SearchListWidget(article: searchItem.toList()[i]);
                                  },
                                  itemCount: searchItem.toList().length,
                                )),
                          )
                        ],
                      );
                    }
                  },
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
  @override
  void dispose() {
    // TODO: implement dispose
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
