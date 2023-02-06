import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/label.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/app_color.dart';
import '../pages/profile_page.dart';
import 'home_page.dart';
import 'like_page.dart';
import 'search_page.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    LikePage(),
    SearchPahe(),
    ProfilePage(),
  ];
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: AppColor.white,
        currentIndex: _currentIndex,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(Label.homebutton),
            selectedColor: AppColor.white,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text(Label.likebutton),
            selectedColor: AppColor.white,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text(Label.searchbutton),
            selectedColor: AppColor.white,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text(Label.profilebutton),
            selectedColor: AppColor.white,
          ),
        ],
      ),
    );
  }
}
