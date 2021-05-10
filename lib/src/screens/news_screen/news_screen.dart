import 'dart:convert';
import 'dart:typed_data';
import 'package:ff_test/src/controller/newsContoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ff_test/src/model/news_model.dart';

class NewsScreen extends StatelessWidget {
  final NewsContoller newsContoller = NewsContoller();

  String firstName = 'First Name';
  String lastName = 'Last Name';
  String caption = 'No Caption';

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: FutureBuilder(
          future: newsContoller.getNews(),
          builder:
              (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> news = snapshot.data;
              return ListView(
                  children: news
                      .map((NewsModel newsModel) => custom(
                            firstName:
                                nullChecker(newsModel.firstName, firstName),
                            lastName: nullChecker(newsModel.lastName, lastName),
                            caption: nullChecker(newsModel.caption, caption),
                            photo: newsModel.photoId,
                          ))
                      .toList());
            }

            return Center(child: CircularProgressIndicator());
          },
        )));
  }

  // custom card

  Widget custom(
      {String firstName,
      String lastName,
      String caption,
      String photo}) {
    /*Uint8List avatarPic;
    photo!= null?  avatarPic = base64Decode(photo): avatarPic=null;*/

    return Container(
      /*decoration: photo!= null ? BoxDecoration(
        image: DecorationImage(
          image: MemoryImage (avatarPic)
        )): null,*/
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
        child: Center(
          child: Column(
            children: [
              ListTile(
                title: Text(firstName + '  ' + lastName),
                leading: CircleAvatar(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  caption,
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  Container(margin: EdgeInsets.only(right: 40.0)),
                  IconButton(
                      icon: Icon(Icons.favorite, color: Colors.redAccent),
                      onPressed: null),
                  Container(margin: EdgeInsets.only(right: 3.0)),
                  Text('28'),
                  Container(margin: EdgeInsets.only(right: 10.0)),
                  IconButton(
                      icon: Icon(Icons.comment_bank_outlined), onPressed: null),
                  Container(margin: EdgeInsets.only(right: 3.0)),
                  Text('12'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // check for if string is null
  String nullChecker(String first, String second) {
    if (first == null) {
      return second;
    } else
      return first;
  }
}
