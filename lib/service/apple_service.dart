
import 'dart:io';
import 'package:dio/dio.dart';
 
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsprogroup/core/api.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class AppleService{
  static Box<Article>? myBox2;
  static Box<Article>? myBox21;
  static Box<bool>? myTrue;

  static Future<NewsModel>getData()async{
      await openBox();
      await openSave();
      await openTrue();
      Response res = await Dio().get("https://newsapi.org/v2/everything?q=apple&from=2022-03-15&to=2022-03-15&sortBy=popularity&apiKey=5fed73614d704fe69828c31e336d8c1d");
      await putData(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
  }

  static openBox()async{
    myBox2 = await Hive.openBox('apple');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static openSave()async{
    myBox21 = await Hive.openBox('appleSave');
    Directory appDocSave = await getApplicationDocumentsDirectory();
    Hive.init(appDocSave.path);
  }
    static openTrue()async{
    myTrue = await Hive.openBox('appleTrue');
    Directory appDocTrue = await getApplicationDocumentsDirectory();
    Hive.init(appDocTrue.path);
  }

  static putData(NewsModel data)async{
    for(var item in data.articles!){
      myBox2!.add(item);
    }
  }

}