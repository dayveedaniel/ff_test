import 'package:ff_test/src/screens/news_screen/news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'apple_screen.dart';
import 'map_screen.dart';
import 'profile_screen.dart';
import 'workout_screen.dart';

class NavBarScreen extends StatefulWidget {
  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int pageindex = 0;
  List<Widget> pagelist = <Widget>[];

  void initState() {
    pagelist.add(NewsScreen());
    pagelist.add(AppleScreen());
    pagelist.add(ProfileScreen());
    pagelist.add(WorkoutScreen());
    pagelist.add(MapScreen());
    super.initState();
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(getTitle()),
      ),
      body: IndexedStack(
        index: pageindex,
        children: pagelist,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            pageindex = index;
          });
          //Handle button tap
        },
        currentIndex: pageindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined), label: 'News'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("lib/assets/icon/apple.png"),
              ),
              label: 'Diet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("lib/assets/icon/union.png")),
              label: 'Workout'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("lib/assets/icon/map.png")),
              label: 'Map')
        ],
      ),
    );
  }

  String getTitle () {
    String title;
    switch (pageindex) {
      case 0 : title = 'News';
      break;
      case 1 : title = 'Diet';
      break;
      case 2 : title = 'Profile';
      break;
      case 3 : title = 'Gym';
      break;
      case 4 : title = 'Map';
      break;
    }
    return title;
  }
}
