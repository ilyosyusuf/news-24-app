import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsprogroup/core/api.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class DomainService{
  static Box<Article>? myBox4;
  static Box<Article>? myBox41;
  
  static Future<NewsModel>getData()async{
      await openBox();
      await openSave();
      Response res = await Dio().get("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5fed73614d704fe69828c31e336d8c1d");
      await putData(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
  }

  static openBox()async{
    myBox4 = await Hive.openBox('domain');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }
  static openSave()async{
    myBox41 = await Hive.openBox('doainSave');
    Directory appDocSave = await getApplicationDocumentsDirectory();
    Hive.init(appDocSave.path);
  }

  static putData(NewsModel data)async{
    for(var item in data.articles!){
      myBox4!.add(item);
    }
  }
}