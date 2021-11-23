// To parse this JSON data, do
//
//     final condoModel = condoModelFromJson(jsonString);

import 'dart:convert';

CondoModel condoModelFromJson(String str) => CondoModel.fromJson(json.decode(str));

String condoModelToJson(CondoModel data) => json.encode(data.toJson());

class CondoModel {
  CondoModel({
    this.condos,
  });

  List<Condo> condos;

  factory CondoModel.fromJson(Map<String, dynamic> json) => CondoModel(
    condos: List<Condo>.from(json["condos"].map((x) => Condo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "condos": List<dynamic>.from(condos.map((x) => x.toJson())),
  };
}

class Condo {
  Condo({
    this.condoId,
    this.condoName,
    this.condoPrice,
    this.condoLocation,
    this.condoPhone,
    this.condoLimitedroom,
    this.condoFacilities,
    this.condoType,
    this.condoDetail,
    this.condoImage,
  });

  String condoId;
  String condoName;
  String condoPrice;
  String condoLocation;
  String condoPhone;
  String condoLimitedroom;
  String condoFacilities;
  String condoType;
  String condoDetail;
  String condoImage;

  factory Condo.fromJson(Map<String, dynamic> json) => Condo(
    condoId: json["condo_id"],
    condoName: json["condo_name"],
    condoPrice: json["condo_price"],
    condoLocation: json["condo_location"],
    condoPhone: json["condo_phone"],
    condoLimitedroom: json["condo_limitedroom"],
    condoFacilities: json["condo_facilities"],
    condoType: json["condo_type"],
    condoDetail: json["condo_detail"],
    condoImage: json["condo_image"],
  );


  Map<String, dynamic> toJson() => {
    "condo_id": condoId,
    "condo_name": condoName,
    "condo_price": condoPrice,
    "condo_location": condoLocation,
    "condo_phone": condoPhone,
    "condo_limitedroom": condoLimitedroom,
    "condo_facilities": condoFacilities,
    "condo_type": condoType,
    "condo_detail": condoDetail,
    "condo_image": condoImage,

  };
}
