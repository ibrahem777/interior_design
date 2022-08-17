import 'package:interior_design_app/src/models/category.dart';

class Service {
  int id;
  String name;
  String description;
  num price;
  num rate;
  String imgUrl;
  Category category;
  Service({this.id,this.name,this.price,this.description,this.category,this.rate,this.imgUrl});
  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    rate: json["rate"],
    imgUrl: json["imgUrl"],

    // category: Category.fromJson(json["category"]) ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imgUrl": imgUrl,
    "name": name,
  };
}
