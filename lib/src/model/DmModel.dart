// To parse this JSON data, do
//
//     final dmModel = dmModelFromJson(jsonString);

import 'dart:convert';

DmModel dmModelFromJson(String str) => DmModel.fromJson(json.decode(str));

String dmModelToJson(DmModel data) => json.encode(data.toJson());

class DmModel {
  DmModel({
    this.dormitorys,
  });

  List<Dormitory> dormitorys;

  factory DmModel.fromJson(Map<String, dynamic> json) => DmModel(
    dormitorys: List<Dormitory>.from(json["dormitorys"].map((x) => Dormitory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dormitorys": List<dynamic>.from(dormitorys.map((x) => x.toJson())),
  };
}

class Dormitory {
  Dormitory({
    this.dmId,
    this.dmName,
    this.dmPrice,
    this.dmLocation,
    this.dmPhone,
    this.dmLimitedroom,
    this.dmFacilities,
    this.dmType,
    this.dmDetail,
    this.dmImage,
  });

  String dmId;
  String dmName;
  String dmPrice;
  String dmLocation;
  String dmPhone;
  String dmLimitedroom;
  String dmFacilities;
  String dmType;
  String dmDetail;
  String dmImage;

  factory Dormitory.fromJson(Map<String, dynamic> json) => Dormitory(
    dmId: json["dm_id"],
    dmName: json["dm_name"],
    dmPrice: json["dm_price"],
    dmLocation: json["dm_location"],
    dmPhone: json["dm_phone"],
    dmLimitedroom: json["dm_limitedroom"],
    dmFacilities: json["dm_facilities"],
    dmType: json["dm_type"],
    dmDetail: json["dm_detail"],
    dmImage: json["dm_image"],
  );

  Map<String, dynamic> toJson() => {
    "dm_id": dmId,
    "dm_name": dmName,
    "dm_price": dmPrice,
    "dm_location": dmLocation,
    "dm_phone": dmPhone,
    "dm_limitedroom": dmLimitedroom,
    "dm_facilities": dmFacilities,
    "dm_type": dmType,
    "dm_detail": dmDetail,
    "dm_image": dmImage,
  };
}
