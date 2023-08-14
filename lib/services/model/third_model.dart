
import 'dart:convert';

ThirdModel thirdModelFromJson(String str) => ThirdModel.fromJson(json.decode(str));

String thirdModelToJson(ThirdModel data) => json.encode(data.toJson());

class ThirdModel {
    int id;
    String carModel;
    String logo;
    int establishedYear;
    int averagePrice;
    String description;
    List<String> carPics;

    ThirdModel({
        required this.id,
        required this.carModel,
        required this.logo,
        required this.establishedYear,
        required this.averagePrice,
        required this.description,
        required this.carPics,
    });

    factory ThirdModel.fromJson(Map<String, dynamic> json) => ThirdModel(
        id: json["id"],
        carModel: json["car_model"],
        logo: json["logo"],
        establishedYear: json["established_year"],
        averagePrice: json["average_price"],
        description: json["description"],
        carPics: List<String>.from(json["car_pics"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "car_model": carModel,
        "logo": logo,
        "established_year": establishedYear,
        "average_price": averagePrice,
        "description": description,
        "car_pics": List<dynamic>.from(carPics.map((x) => x)),
    };
}
