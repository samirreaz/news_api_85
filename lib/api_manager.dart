import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_85/news_model.dart';

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var model = null;
    try {
      var url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=fa2266bb6b764af8816b75d85ef70762',
      );
      var response = await client.get(url);
      if (response.statusCode == 200) {
        //print('success');
        var jsonString = await response.body;

        var jsonMap = await json.decode(jsonString);
        print(jsonMap);
        model = await NewsModel.fromJson(jsonMap);
        print(model);
      }
    } catch (Excetion) {
      print('Error');
      return model;
    }
    return model;
  }
}
