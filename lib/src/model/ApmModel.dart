// To parse this JSON data, do
//
//     final condoModel = condoModelFromJson(jsonString);

import 'dart:convert';

ApmModel ApmModelFromJson(String str) => ApmModel.fromJson(json.decode(str));

String ApmModelToJson(ApmModel data) => json.encode(data.toJson());

class ApmModel {
  ApmModel({
    this.apartments,
  });

  List<Apartment> apartments;

  factory ApmModel.fromJson(Map<String, dynamic> json) => ApmModel(
    apartments: List<Apartment>.from(json["apartments"].map((x) => Apartment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "apartments": List<dynamic>.from(apartments.map((x) => x.toJson())),
  };
}

class Apartment {
  Apartment({
    this.apmId,
    this.apmName,
    this.apmPrice,
    this.apmLocation,
    this.apmPhone,
    this.apmLimitedroom,
    this.apmFacilities,
    this.apmType,
    this.apmDetail,
    this.apmImage,
  });

  String apmId;
  String apmName;
  String apmPrice;
  String apmLocation;
  String apmPhone;
  String apmLimitedroom;
  String apmFacilities;
  String apmType;
  String apmDetail;
  String apmImage;

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
    apmId: json["apm_id"],
    apmName: json["apm_name"],
    apmPrice: json["apm_price"],
    apmLocation: json["apm_location"],
    apmPhone: json["apm_phone"],
    apmLimitedroom: json["apm_limitedroom"],
    apmFacilities: json["apm_facilities"],
    apmType: json["apm_type"],
    apmDetail: json["apm_detail"],
    apmImage: json["apm_image"],
  );

  Map<String, dynamic> toJson() => {
    "apm_id": apmId,
    "apm_name": apmName,
    "apm_price": apmPrice,
    "apm_location": apmLocation,
    "apm_phone": apmPhone,
    "apm_limitedroom": apmLimitedroom,
    "apm_facilities": apmFacilities,
    "apm_type": apmType,
    "apm_detail": apmDetail,
    "apm_image": apmImage,
  };
}
