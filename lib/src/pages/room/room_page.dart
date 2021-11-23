import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/model/ApmModel.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Future<RoomPage> _upcomingMovieModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('ประเภทห้องเช่า')
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgwhite12.jpeg'),
                  fit: BoxFit.cover,
                )),
          ),
          Column(
            children: <Widget>[
              //CircleAvatar(
              //radius: 50,
              //backgroundImage: AssetImage('assets/images/house.png'),
              //),
              Text(
                'ประเภทห้องเช่า',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.white),
              ),
               Text(
                 'ประเภทห้องเช่า',
                style: TextStyle(
                     fontSize: 30,
                     fontFamily: 'Source Sans Pro',
                     color: Colors.redAccent),
               ),
              SizedBox(
                width: 200,
                height: 30,
                child: Divider(
                  color: Colors.cyan,
                  thickness: 5,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoute.condoRoute);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Row(
                    children: <Widget>[
                      Image.network('https://cdn-icons.flaticon.com/png/512/3008/premium/3008593.png?token=exp=1637666185~hmac=5e7957dcd68e57461c496a93f9b0ca2f',
                        width: 60,
                        height: 60,)
                      ,
                      //Icon(
                      //Icons.home_work_rounded,
                      //color: Colors.red,
                      //),
                      //SizedBox(width: 5),
                      Text(
                        'คอนโดมิเนี่ยน',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoute.apartmentRoute);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Row(
                    children: <Widget>[
                      Image.network('https://cdn-icons-png.flaticon.com/512/1539/1539548.png',
                        width: 60,
                        height: 60,)
                      ,
                      SizedBox(width: 5),
                      Text(
                        'อพาร์ทเมนท์',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoute.domitoryRoute);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Row(
                    children: <Widget>[
                      Image.network('https://cdn-icons-png.flaticon.com/512/1464/1464155.png',
                        width: 60,
                        height: 60,),
                      Text(
                          'หอพัก',
                          style: TextStyle(fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
