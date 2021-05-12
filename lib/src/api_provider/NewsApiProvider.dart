import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class NewsApiProvider {
  final String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDgwNDg0NiwiZXhwIjoxNjIwODkxMjQ2fQ.DGqLPPpNctJnS-CXyxYgFJ013THRR0L9Kh1ZIkr7weY';
  Map<String, String> queryParamaters = {
    'limit': '10',
    'offset': '0',
    'maxDate': '2021-05-06T18:26:42.820994'
  };

  Future <List<NewsModel>> getNews() async {
    final response = await http.get(
        Uri.https('app.ferfit.club', 'api/feed', queryParamaters),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_token'
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);

      Map<String, dynamic> results = body['result'];
      List posts = results['posts'];
      List<NewsModel> news =
          posts.map((dynamic item) => NewsModel.fromJson(item)).toList();

      return news;
    } else {
      throw Exception("Cant get posts");
    }
  }
}
