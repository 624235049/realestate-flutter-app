import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/model/ApmModel.dart';
import 'package:miniproject/src/services/network.dart';

class ApmPage extends StatefulWidget {
  @override
  _ApmPageState createState() => _ApmPageState();
}

class _ApmPageState extends State<ApmPage> {
  Future<ApmModel> _apartmentModel;
  bool isSearching = false;
  bool check = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool _checkboxValue = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;

  String _searchText = "";
  _ApmPageState() {
    _filter.addListener(() {
      if(_filter.text.isEmpty){
        setState(() {
          _searchText = "";
          filteredNames = names;
        });

      }else{
        setState(() {
          _searchText = _filter.text;
        });

      }
    });

  }



  @override
  void initState() {
    _getNames();
    super.initState();
  }

  List names = new List();
  List filteredNames = new List();

  Future<void> _getNames() async {
    List tempList = new List();

    _apartmentModel = NetworkService().getAllApmDio();
    if (_apartmentModel.toString().isNotEmpty) {
      await _apartmentModel.then((value) => {
        for (int i = 0; i < value.apartments.length; i++)
          {
            tempList.add(value.apartments[i]),
          }
      });
    } //end if
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  } //end method

  @override
  Widget build(BuildContext context) {
    if(!_searchText.isEmpty){
      List tempList = new List();
      for(int i = 0; i < filteredNames.length; i++){
        Apartment apartment = filteredNames[i];
        if(apartment.apmName.toLowerCase().contains(_searchText.toLowerCase())){
          tempList.add(filteredNames[i]);

        }

      }
      filteredNames = tempList;

    }else{
      filteredNames = names;
    }
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: FutureBuilder<ApmModel>(
            future: NetworkService().getAllApmDio(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemCount: names == null ? 0 : filteredNames.length,
                  itemBuilder: (context, index) {
                    Apartment apartment = filteredNames[index];
                    return Material(
                      child: InkWell(
                         onTap: () {
                           // Navigator.pushNamed(
                           //    context, AppRoute.apartmentRoute,
                           //     arguments: apartment);
                         },
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Card(
                              child: Container(
                                color: Colors.teal.shade50,
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      apartment.apmImage != ""
                                          ? Image.network(
                                        API.APARTMENT_IMAGE + apartment.apmImage,
                                        height: 250,
                                      )
                                          : Image.asset(
                                        'assets/images/no_photo.png',
                                        height: 160,
                                      ),
                                      Text(
                                        apartment.apmId + "  " + apartment.apmName,
                                        textAlign: TextAlign.center,
                                      ),
                                      apartment.apmDetail == '0'
                                          ? Text(
                                        '฿' +
                                            apartment.apmPrice +
                                            ' out of stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      )
                                          : Text('฿' +
                                          apartment.apmPrice +
                                          '  ' +
                                          apartment.apmPhone +
                                          ''),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  AppRoute.apmdetailRoute,
                                                  arguments: apartment);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.teal),
                                            child: Text('รายละเอียด'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                      child: ListView(shrinkWrap: true, children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'น้อยกว่า 3,000 บาท',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 20),
                                ),
                                Checkbox(
                                    value: check,
                                    onChanged: (bool value) {
                                      setState(() {
                                        check = value;
                                      });
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('3,000 - 4,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                Checkbox(
                                    value: check2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        check2 = value;
                                      });
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('4,000 - 5,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                Checkbox(
                                    value: check3,
                                    onChanged: (bool value) {
                                      setState(() {
                                        check3 = value;
                                      });
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('มากกว่า 5,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                Checkbox(
                                    value: _checkboxValue4,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _checkboxValue4 = value;
                                      });
                                    })
                              ],
                            ),
                          ]),
                        ),
                      ])),
                );
              });
        },
        backgroundColor: Colors.teal.shade300,
        tooltip: 'add',
        child: Icon(Icons.all_inbox),
      ),
    );
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('ค้นหาห้องพัก');

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.cyan,
      centerTitle: true,
      title: _appBarTitle,
      actions: [
        IconButton(
            onPressed: () {
              _searchPressed();
            },
            icon: _searchIcon)
      ],
    );
  }

  final TextEditingController _filter = new TextEditingController();

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        print('IF search icon');
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: TextStyle(color: Colors.white60, fontSize: 20),
          controller: _filter,
          decoration: new InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        print('ELSE search icon');
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('');
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}
