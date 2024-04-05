import 'package:aniflix/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/mylist.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../pages/watchpage.dart';

final currentPageController = Get.put(CurrentPageController());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var Screen = [
      Watchpage(),
      Searchpage(),
      MyList(),
      Profile(),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.teal, Colors.blue]),
                ),
                child: GNav(
                  backgroundColor: Colors.transparent,
                  color: Colors.black,
                  activeColor: Colors.purple,
                  tabBackgroundColor: Colors.white,
                  padding: EdgeInsets.all(18),
                  onTabChange: (int index) {
                    currentPageController.updateSelectedPage(
                        index); // Update selected page index
                  },
                  gap: 8,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.bookmark,
                      text: 'My List',
                    ),
                    GButton(
                      icon: Icons.icecream,
                      text: 'Profile',
                    ),
                  ],
                ),
              ))),
      body: Obx(
        () {
          // Depending on the selected page index, return the corresponding widget
          switch (currentPageController.selectedPage.value) {
            case 0:
              return Watchpage();
            case 1:
              return Searchpage();
            case 2:
              return MyList();
            case 3:
              return Profile();
            default:
              return SizedBox
                  .shrink(); // Return an empty widget if index is out of bounds
          }
        },
      ),
    );
  }
}
