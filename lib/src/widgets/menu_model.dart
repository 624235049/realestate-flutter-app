import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';


class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewModel {
  MenuViewModel();


  List<Menu> get items => <Menu>[
    Menu(
      title: 'โปรไฟล์ Suban',
      icon: Icons.person,
      iconColor: Colors.blue,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.infoRoute);
      },
    ),
    Menu(
      title: 'โปรไฟล์ Natthawat',
      icon: Icons.person,
      iconColor: Colors.blue,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.infoRouteNon);
      },
    ),
    Menu(
      title: 'ลงชื่อเข้าใช้',
      icon: Icons.person,
      iconColor: Colors.greenAccent,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.LoginRoute);
      },
    ),
    Menu(
      title: 'ประเถทห้องเช่า',
      icon: Icons.map,
      iconColor: Colors.cyan,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.roomRoute);
      },
    ),
    Menu(
      title: 'เพิ่มห้องเช่า',
      icon: Icons.add_box,
      iconColor: Colors.cyan,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.roomAddRoute);
      },
    ),
    Menu(
      title: 'เปรียบเทียบราคาห้องเช่า',
      icon: Icons.dashboard,
      iconColor: Colors.indigo,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.compareRoute);
        //todo
      },
    ),
  ];
}