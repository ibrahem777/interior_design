class Offer{
  int id;
  String name;
  String imgUrl;
  num price;

  Offer({this.id,this.name,this.imgUrl,this.price});
  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    name: json["name"],
    imgUrl: json["imgUrl"],
    price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imgUrl": imgUrl,
    "price": price,

  };

}