import '../../bloc/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ff_test/src/model/news_model.dart';


class NewsScreen extends StatelessWidget {
  final NewsModel newsModel = NewsModel();

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: StreamBuilder(
          stream: newsBloc.news,
          builder:
              (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
            if (snapshot.hasData) {
              //List<NewsModel> news = snapshot.data;
              return newsView(snapshot);
            }

            return Center(child: CircularProgressIndicator());
          },
        )));
  }

  // custom card

  Widget newsView( AsyncSnapshot<NewsModel> snapshot) {
    /*Uint8List avatarPic;
    photo!= null?  avatarPic = base64Decode(photo): avatarPic=null;*/

    return Container(
      color: snapshot.data.photoId!= null ? Colors.redAccent: null,
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
                title: Text(snapshot.data.firstName + '  ' + snapshot.data.lastName),
                leading: CircleAvatar(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  snapshot.data.caption,
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
}
