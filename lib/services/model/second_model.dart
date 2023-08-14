// To parse this JSON data, do
//
//     final secondModel = secondModelFromJson(jsonString);

import 'dart:convert';

SecondModel secondModelFromJson(String str) => SecondModel.fromJson(json.decode(str));

String secondModelToJson(SecondModel data) => json.encode(data.toJson());

class SecondModel {
    List<Datum> data;

    SecondModel({
        required this.data,
    });

    factory SecondModel.fromJson(Map<String, dynamic> json) => SecondModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String carModel;
    int averagePrice;
    String logo;
    int establishedYear;

    Datum({
        required this.id,
        required this.carModel,
        required this.averagePrice,
        required this.logo,
        required this.establishedYear,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        carModel: json["car_model"],
        averagePrice: json["average_price"],
        logo: json["logo"],
        establishedYear: json["established_year"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "car_model": carModel,
        "average_price": averagePrice,
        "logo": logo,
        "established_year": establishedYear,
    };
}
