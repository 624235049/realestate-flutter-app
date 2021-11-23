import 'package:flutter/material.dart';

class InfoPageNon extends StatefulWidget {
  @override
  State<InfoPageNon> createState() => _InfoPageNonState();
}

class _InfoPageNonState extends State<InfoPageNon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9fa8da),
      appBar: AppBar(
        title: Text('Natthawat Info'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
               gradient: LinearGradient(
                   colors: [Color(0XFFF005AA7), Color(0XFFFFFFDE4)],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 stops: [0.6,1],
               ),
              ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/noninfo.jpg'),
              ),
              const Text(
                'Nattha khamkhom',
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
                      'Nikename : Non',
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
                      'Phone number : 096-7612479',
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
                      'Email : Natthawat@gmail.com',
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
