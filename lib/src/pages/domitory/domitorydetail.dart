

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/configs/app_route.dart';

import 'package:miniproject/src/model/CondoModel.dart';
import 'package:miniproject/src/model/DmModel.dart';


class DmDetailPage extends StatefulWidget {
  @override
  _DmDetailPageState createState() => _DmDetailPageState();
}

class _DmDetailPageState extends State<DmDetailPage> {
  Dormitory _domitoryModel;
  double rating = 0;
  @override
  void initState() {
    _domitoryModel = Dormitory();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Dormitory) {
      _domitoryModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_domitoryModel.dmName),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Image.network(
                  API.DORMITORY_IMAGE + _domitoryModel.dmImage),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Name : ' + _domitoryModel.dmName,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'รายละเอียด',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(_domitoryModel.dmDetail,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: ('Palatino'),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.favorite_border,size: 25, color: Colors.red,),
                  onPressed: (){},
                ),
                IconButton(icon: Icon(Icons.add_alert_outlined,size: 25, color: Colors.purple,),
                  onPressed: (){},
                ),
                IconButton(icon: Icon(Icons.share,size: 25, color: Colors.amber,),
                  onPressed: (){},
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.mapRoute);
              },
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
              child: Text('จองห้องพัก'),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rating : $rating',
                    style: TextStyle(fontSize: 20),
                  ),
                  RatingBar.builder(
                    minRating: 1,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) => setState((){
                      this.rating = rating;
                    }),
                  ),
                  TextButton(
                    child: Text(
                      'Show Dialog',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => showRating(),
                  ),
                ],
              ),
            ),
            Text(
              'Comment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'comment..',
                prefixIcon: Icon(Icons.send),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
  showRating() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Rate This App'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Please leave a star rating',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20,),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

