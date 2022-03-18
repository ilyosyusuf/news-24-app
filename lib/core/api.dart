import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{
  static String myApiKey = dotenv.env["API_KEY"]!;
  
  static String myTesla = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-01&sortBy=publishedAt&apiKey=$myApiKey";
  static String myApple = "https://newsapi.org/v2/everything?q=apple&from=2022-03-09&to=2022-03-09&sortBy=popularity&apiKey=$myApiKey";
  static String myBusiness = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$myApiKey";
  static String mytechCrunch = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$myApiKey";
  static String myDomains = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$myApiKey";
}