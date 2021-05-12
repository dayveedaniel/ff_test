import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../model/news_model.dart';
import '../api_provider/NewsApiProvider.dart';

class NewsBloc {
  NewsApiProvider newsApiProvider = NewsApiProvider();

  final contoller = BehaviorSubject<NewsModel>();

  Stream<NewsModel> get news => contoller.stream;

   void getNews() async{
    String firstName = 'First Name';
    String lastName = 'Last Name';
    String caption = 'No Caption';

    final List<NewsModel> newsModelList = await newsApiProvider.getNews();

    for (var newsModel in newsModelList) {
      if (newsModel.firstName == null) {
        newsModel.firstName = firstName;
      }
      if (newsModel.lastName == null) {
        newsModel.lastName = lastName;
      }
      if (newsModel.caption == null) {
        newsModel.caption = caption;
      }
      contoller.sink.add(newsModel);
    }
  }

  dispose() => contoller.close();
}

final newsBloc = NewsBloc();
