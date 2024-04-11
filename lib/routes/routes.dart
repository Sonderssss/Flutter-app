import 'package:aniflix/details/bleach.dart';
import 'package:aniflix/details/castlevania.dart';
import 'package:aniflix/details/demon.dart';
import 'package:aniflix/details/goh.dart';
import 'package:aniflix/details/jujutsu.dart';
import 'package:aniflix/details/naruto.dart';
import 'package:aniflix/pages/upload.dart';
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
    GetPage(name: '/upload', page: () => Upload()),

    GetPage(name: '/bleach', page: () => First()),
    GetPage(name: '/castlevania', page: () => Second()),
    GetPage(name: '/demon', page: () => Third()),
    GetPage(name: '/goh', page: () => Fourth()),
    GetPage(name: '/jujutsu', page: () => Fifth()),
    GetPage(name: '/naruto', page: () => Sixth()),
  ];
}
