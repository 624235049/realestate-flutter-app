

import 'package:flutter/material.dart';
import 'package:miniproject/src/pages/apartment/apartment_page.dart';
import 'package:miniproject/src/pages/apartment/apartmentdetail.dart';
import 'package:miniproject/src/pages/compare/compare_page.dart';
import 'package:miniproject/src/pages/condo/condo_page.dart';
import 'package:miniproject/src/pages/condo/condodetail.dart';
import 'package:miniproject/src/pages/domitory/Domitory_page.dart';
import 'package:miniproject/src/pages/domitory/domitorydetail.dart';
import 'package:miniproject/src/pages/home/home_page.dart';
import 'package:miniproject/src/pages/info/info_page.dart';
import 'package:miniproject/src/pages/info/info_page2.dart';
import 'package:miniproject/src/pages/login/login_page.dart';
import 'package:miniproject/src/pages/map/google_map_page.dart';
// import 'package:miniproject/src/pages/movie/movie_detail_page.dart';
// import 'package:miniproject/src/pages/movie/upcoming_movie_page.dart';
// import 'package:miniproject/src/pages/movie/video_page.dart';
import 'package:miniproject/src/pages/pages.dart';
import 'package:miniproject/src/pages/register/register_page.dart';
import 'package:miniproject/src/pages/room/roomAddPage.dart';
import 'package:miniproject/src/pages/room/room_page.dart';


class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const LoginRoute = "login";
  static const upcomingMovieRoute = "upcoming";
  static const MovieDetilRoute = "movie";
  static const videoRoute = "video";
  static const qrScanRoute = "qrScan";
  static const qrCreateRoute = "qrCreate";
  static const gameRoute = "game";
  static const gameManagementRoute = "gameManage";
  static const mapRoute = "Map";
  static const registerRoute = "Register";
  static const condoRoute = "condo";
  static const condodetailRoute = "condodetail";
  static const apartmentRoute = "apartment";
  static const roomRoute = "room";
  static const apmdetailRoute = "apmdetail";
  static const domitoryRoute = "domitory";
  static const domitorydetailRoute = "domitorydetail";
  static const roomAddRoute = "roomadd";
  static const compareRoute = "compare";
  static const infoRouteNon = "infonon";



  final _route = <String, WidgetBuilder>{
     homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
    LoginRoute: (context) => LoginPage(),
    // upcomingMovieRoute: (context) => UpcomingMoviePage(),
    // MovieDetilRoute: (context) => MovieDetailPage(),
    // videoRoute: (context) => VideoPage(),
    // gameRoute: (context) => GamePage(),
    // gameManagementRoute: (context) => GameManagementPage(),
    mapRoute: (context) => GoogleMapPage(),
    registerRoute: (context) => MySignUpPage(),
    condoRoute: (context) => CondoPage(),
    condodetailRoute: (context) => CondoDetailPage(),
    apartmentRoute: (context) => ApmPage(),
    roomRoute: (context) => RoomPage(),
    apmdetailRoute: (context) => ApmDetailPage(),
    domitoryRoute: (context) => DmPage(),
    domitorydetailRoute: (context) => DmDetailPage(),
    roomAddRoute: (context) => RoomaddPage(),
    compareRoute: (context) => ComparePage(),
    infoRouteNon: (context) => InfoPageNon(),

  };

  get getAll => _route;
}//end class