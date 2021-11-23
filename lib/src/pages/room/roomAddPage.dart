import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/model/CondoModel.dart';
import 'package:miniproject/src/services/network.dart';

class RoomaddPage extends StatefulWidget {
  RoomaddPage({Key key}) : super(key: key);

  @override
  _RoomaddPageState createState() => _RoomaddPageState();
}

class _RoomaddPageState extends State<RoomaddPage> {
  File _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  bool _editMode;
  Condo _condo;

  @override
  void initState() {
    _editMode = false;
    _condo = Condo();
    super.initState();
  }

  callback(File image){
    _image = image;

  }


  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if(arguments is Condo){
      _condo = arguments;
      _editMode = true;
    }
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildIdInput(),
                        flex: 1,
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: _buildNameInput(),
                        flex: 2,
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  _buildDetailInput(),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildPriceInput(),
                        flex: 1,
                      ),

                      SizedBox(height: 12.0),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  _buildImageInput(),
                  SizedBox(height: 12.0),
                  ProductImage(callback, image: _condo.condoImage),
                ],
              ),
            ),
          ),
        )
    );
  }

  InputDecoration inputStyle({String label}) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.indigo,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
    labelText: label,
  );


  TextFormField _buildIdInput() => TextFormField(
    enabled: !_editMode,
    initialValue: _condo.condoId ?? "",
    decoration: inputStyle(label: "ลำดับ"),
    onSaved: (String value) {
      print(value);
      _condo.condoId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: _condo.condoName ?? "",
    decoration: inputStyle(label: "ชื่อห้องเช่า"),
    onSaved: (String value) {
      print(value);
      _condo.condoName = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue: _condo.condoPrice == null ? '0' : _condo.condoPrice.toString(),
    decoration: inputStyle(label: "ราคา"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      print(value);
      _condo.condoPrice = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue: _condo.condoDetail ?? "",
    decoration: inputStyle(label: "รายละเอียด"),
    onSaved: (String value) {
      print(value);
      _condo.condoDetail = value;
    },
  );


  TextFormField _buildImageInput() => TextFormField(
    initialValue: _condo.condoImage ?? "",
    decoration: inputStyle(label: "รูปภาพ"),
    onSaved: (String value) {
      print(value);
      _condo.condoImage = value;
    },
  );


  AppBar _buildAppBar() => AppBar(
    centerTitle: false,
    title: Text(_editMode ? 'Edit Condo' : 'เพิ่มห้องเช่า'),
    backgroundColor: Colors.cyan,
    actions: [
      TextButton(
        onPressed: () async {
          _formKey.currentState.save();
          FocusScope.of(context).requestFocus(FocusNode());
          if (_editMode) {
            try{
              final message = await NetworkService().editCondoDio(_image, _condo);
              if(message == 'Edit Successfully'){
                Flushbar(
                  icon: Icon(
                    Icons.assignment_turned_in_outlined,
                    color: Colors.green,
                  ),
                  backgroundColor: Colors.indigo,
                  title:  "Edit",
                  message:  "Edit Failed",
                  duration:  Duration(seconds: 5),
                )..show(context);
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.condoRoute, (route) => false);
              }else{
                Flushbar(
                  icon: Icon(
                    Icons.assignment_turned_in_outlined,
                    color: Colors.green,
                  ),
                  backgroundColor: Colors.indigo,
                  title:  "Edit",
                  message:  "Edit Failed",
                  duration:  Duration(seconds: 5),
                )..show(context);
              }
            }catch(ex){
              Flushbar(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
                backgroundColor: Colors.indigo,
                title:  "Add",
                message:  "Add Failed",
                duration:  Duration(seconds: 5),
              )..show(context);
            }

          } else {
            try{
              final message = await NetworkService().addCondoDio(_image, _condo);
              if(message == 'Add Successfully'){
                Flushbar(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ),
                  backgroundColor: Colors.indigo,
                  title:  "Add",
                  message:  "Add Failed",
                  duration:  Duration(seconds: 5),
                )..show(context);
              }else{
                Flushbar(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ),
                  backgroundColor: Colors.indigo,
                  title:  "Add",
                  message:  "Add Failed",
                  duration:  Duration(seconds: 5),
                )..show(context);
              }
            }catch(ex){
              Flushbar(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
                backgroundColor: Colors.indigo,
                title:  "Add",
                message:  "Add Failed",
                duration:  Duration(seconds: 5),
              )..show(context);
            }
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.condoRoute, (route) => false);
          }
        },
        child: Text('submit',style: TextStyle(color: Colors.white70),),
      )
    ],
  );
} //end class

class ProductImage extends StatefulWidget {
  final Function callBack;
  final String image;

  const ProductImage(this.callBack, {Key key, @required this.image})
      : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File _imageFile;
  String _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    _image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    _imageFile?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  dynamic _buildPreviewImage() {
    if ((_image == null || _image.isEmpty) && _imageFile == null) {
      return SizedBox();
    }

    final container = (Widget child) => Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.center,
      height: 350,
      child: child,
    );

    return _image != null
        ? container(Image.network('${API.CONDO_IMAGE}/$_image'))
        : Stack(
      children: [
        container(Image.file(_imageFile)),
        _buildDeleteImageButton(),
      ],
    );
  }

  OutlinedButton _buildPickerImage() => OutlinedButton.icon(
    icon: Icon(Icons.image),
    label: Text('image'),
    onPressed: () {
      _modalPickerImage();
    },
  );

  void _modalPickerImage() {
    final buildListTile =
        (IconData icon, String title, ImageSource source) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
        _pickImage(source);
      },
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(
                Icons.photo_camera,
                "Take a picture from camera",
                ImageSource.camera,
              ),
              buildListTile(
                Icons.photo_library,
                "Choose from photo library",
                ImageSource.gallery,
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) {
    _picker
        .getImage(
      source: source,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        setState(() {
          _imageFile = File(file.path);
          _image = null;
          widget.callBack(_imageFile);
        });
      }
    }).catchError((error) {
      //todo
    });
  }


  Positioned _buildDeleteImageButton() => Positioned(
    right: 0,
    child: IconButton(
      onPressed: () {
        setState(() {
          _imageFile = null;
          widget.callBack(null);
        });
      },
      icon: Icon(
        Icons.clear,
        color: Colors.black54,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}