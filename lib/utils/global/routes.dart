import 'package:flutter/material.dart';


import '../../scrren/detail_page/detail_page.dart';
import '../../scrren/home_page/home_page.dart';



class Routes {
  static String home_page = '/';
  static String detail_page = 'detail_page';

  static Map<String, WidgetBuilder> myRoutes = {
    home_page: (context) => const HomePage(),
    detail_page: (context) => const DetailPage(),
  };
}
