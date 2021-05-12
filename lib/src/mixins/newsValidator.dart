import 'dart:async';
import '../model/news_model.dart';
class NewsValidator {


  final validateNews =
  StreamTransformer<NewsModel, NewsModel>.fromHandlers(handleData: (newsModel, sink) {
    String firstName = 'First Name';
    String lastName = 'Last Name';
    String caption = 'No Caption';

    if (newsModel.firstName == null) {
      newsModel.firstName = firstName;
    }
    if (newsModel.lastName == null) {
      newsModel.lastName = lastName;
    }
    if (newsModel.caption == null) {
      newsModel.caption = caption;
    }
      sink.add(newsModel);
  });

  }
