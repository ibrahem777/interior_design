import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_app/src/models/category.dart';
import 'package:interior_design_app/src/models/offer.dart';
import 'package:interior_design_app/src/models/service.dart';

Stream<List<Service>>getAllServices({
  String chatRoomId,
}) {
  return FirebaseFirestore.instance
      .collection('services')
      .snapshots().map((event) => event.docs.map((e) => Service.fromJson( e.data())).toList());

}
Stream<List<Offer>>getAllOffers({
  String chatRoomId,
}) {
  return FirebaseFirestore.instance
      .collection('offers')
      .snapshots().map((event) => event.docs.map((e) => Offer.fromJson( e.data())).toList());

}
Future<List<Category>>getAllCategories({
  String chatRoomId,
}) async{
  return await FirebaseFirestore.instance .collection('categories').get().then((value) => value.docs.map((e) => Category.fromJson( e.data())).toList());

}