import 'package:aniflix/views/login.dart';
import 'package:get/get.dart';

import '../pages/mylist.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../pages/watchpage.dart';
import '../views/home.dart';
import '../views/signup.dart';

class Routes {
  static var routes = [
    GetPage(name: '/Login', page: () => Loginpage()),
    GetPage(name: '/Signup', page: () => Signup()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/Watchpage', page: () => Watchpage()),
    GetPage(name: '/search', page: () => Searchpage()),
    GetPage(name: '/my-list', page: () => MyList()),
    GetPage(name: '/profile', page: () => Profile()),
  ];
}
