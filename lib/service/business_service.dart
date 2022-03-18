import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsprogroup/core/api.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class BusinessService{
  static Box<Article>? myBox3;
  static Box<Article>? myBox31;
  
  static Future<NewsModel>getData()async{
      await openBox();
      await openSave();
      Response res = await Dio().get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5fed73614d704fe69828c31e336d8c1d");
      await putData(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
  }

  static openBox()async{
    myBox3 = await Hive.openBox('business');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

  }

  static openSave()async{
    myBox31 = await Hive.openBox('businessSave');
    Directory appDocSave = await getApplicationDocumentsDirectory();
    Hive.init(appDocSave.path);
  }

  static putData(NewsModel data)async{
    for(var item in data.articles!){
      myBox3!.add(item);
    }
  }
}