import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsprogroup/core/api.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class NewsService{
  static Box<Article>? myBox1;
  static Box<Article>? myBox11;

  
  static Future<NewsModel>getData()async{
      await openBox();
      await openSave();
      Response res = await Dio().get("https://newsapi.org/v2/everything?q=tesla&from=2022-02-16&sortBy=publishedAt&apiKey=5fed73614d704fe69828c31e336d8c1d");
      await putData(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
  }

  static openBox()async{
    myBox1 = await Hive.openBox('news');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static openSave()async{
    myBox11 = await Hive.openBox('newsSave');
    Directory appDocSave = await getApplicationDocumentsDirectory();
    Hive.init(appDocSave.path);
  }

  static putData(NewsModel data)async{
    for(var item in data.articles!){
      myBox1!.add(item);
    }
  }
}