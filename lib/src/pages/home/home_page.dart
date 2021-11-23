import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/widgets/menu_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current =0;
  final urlImage = 'https://www.saphanmai.com/wp-content/uploads/2020/03/1.jpg';
  final List<String> imgList = [
    'https://whyibuythiscondo.com/wp-content/uploads/2017/09/21559065_496479854055637_9086849269439419764_n.jpg',
    'https://whyibuythiscondo.com/wp-content/uploads/2017/09/21557649_496479680722321_5236926880604046904_n.jpg',
    'https://whyibuythiscondo.com/wp-content/uploads/2017/09/21640790_496479777388978_5669391444603365777_o-1600x733.jpg',
    'https://whyibuythiscondo.com/wp-content/uploads/2017/09/21587046_496479674055655_9222976287364109703_o.jpg',
    'https://whyibuythiscondo.com/wp-content/uploads/2017/09/21587379_496479677388988_115477273058158660_o.jpg',
    // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://cdn.chiangmainews.co.th/wp-content/uploads/2016/06/07163250/333-26.jpg",
      "title": "คอนโดราคาถูก",
      "description":
      "You need a creative space ready for your art? We got that covered.",
      "price": "\$400",
      "page": "login"
    },
    {
      "img":
      "https://static.estopolis.com/article/58ec41d115f0206d4f9fc148_58ec43f415f0206d4f9fc160.jpg",
      "title": "หอพักราคาถูก",
      "description":
      "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
      "http://www.naibann.com/wp-content/uploads/2021/01/condominium-decor-by-mr-pentium-31.jpg",
      "title": "อพาร์ทเม้นท์",
      "description":
      "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          // Important: Remove any padding from the ListView.
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Home booking'),
              accountEmail: Text('Application'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/barcondo.jpg',),
              fit: BoxFit.cover,
            )),
      ),

            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
                // Update the state of the app.
                // ...
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title:  Text('Logout'),
              onTap: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.remove(AppSetting.userNameSetting);
                // prefs.remove(AppSetting.passwordSetting);
                // Navigator.pushNamed(context, AppRoute.LoginRoute);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(title: Text('หน้าหลัก',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/barcondo.jpg'),
                  fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(Colors.orange.withOpacity(0), BlendMode.darken)
                )
              )
            ),
          ),
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgwhite12.jpeg'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(imgList[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(height : 30),
            Container(
              color: Colors.white60,
              child: Text(
                'Home rental booking application',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.upcomingMovieRoute);
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.apartmentRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/apm03.png'), scale: 10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.condoRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/condo111.png'),
                          scale: 10),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.mapRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.png'), scale: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.domitoryRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/dm03.png'), scale: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('')],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.upcomingMovieRoute);
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.qrScanRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/price1111.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.gameRoute);
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.gameRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/price2222.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 5),
            ListTile(
              onTap: (){
              },
            ),
            SizedBox(height: 20),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                            children: [
                            Text(item["price"],
                            style: TextStyle(
                                fontSize: 16, color: Colors.cyan)),
                        Text(item["title"],
                            style:
                            TextStyle(fontSize: 32, color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8),
                            child: Text(
                              item["description"],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}