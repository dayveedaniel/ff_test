import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/news_bloc.dart';


class MapScreen extends StatelessWidget {

  NewsBloc newsBloc = NewsBloc();

  Widget build(context) {

    newsBloc.getNews();

    return  Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text('Maps Screen'),
        ));
  }
}