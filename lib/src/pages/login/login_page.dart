import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงชื่อผู้ใช้'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Color(0XFFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'เข้าสู่ระบบ',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: <Widget>[
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'อีมล',
                      icon: Icon(Icons.account_box_outlined)),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: isHidden,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    icon: Icon(Icons.smartphone),
                    suffixIcon: IconButton(
                        icon: isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: togglePasswordVisibility),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('เข้าสู่ระบบ'),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.homeRoute);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('สมัครสมาชิก'),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.registerRoute);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
            ),
            Image.asset('assets/images/condo2.png')
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
} //end class
