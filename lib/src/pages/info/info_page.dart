import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9fa8da),
      appBar: AppBar(
        title: Text('Suban Info'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Color(0XFFF005AA7), Color(0XFFFFFFDE4)],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: [0.6,1],
                // ),
              image: DecorationImage(
                  image: AssetImage('assets/images/condoinfo.jpg',),
            fit: BoxFit.cover,
            )),
            ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/boat12.jpg'),
              ),
              const Text(
                'Suban Noksang',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    color: Colors.white70),
              ),
              const Text(
                'STUDENT',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white),
              ),
              const SizedBox(
                width: 250,
                height: 40,
                child: Divider(
                  color: Colors.indigo,
                  thickness: 6,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility_new_rounded,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Nikename : Boat',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white70,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.add_call,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Phone number : 061-1675623',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white70,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.attach_email,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Email : Boatsuban@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
