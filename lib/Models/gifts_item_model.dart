import 'package:cloud_firestore/cloud_firestore.dart';

class GiftItemModel {
  final String? id;
  final String? ImageItem;
  final String? PointItem;
  final String? cashbackitem;
  final String? nameItem;

  const GiftItemModel({
    this.id,
    required this.ImageItem,
    required this.cashbackitem,
    required this.PointItem,
    required this.nameItem,
  });

  toJson() {
    return {
      'ImageItem': ImageItem,
      'PointItem': PointItem,
      'cashbackitem': cashbackitem,
      'nameItem': nameItem,
    };
  }

  factory GiftItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return GiftItemModel(
        id: document.id,
        ImageItem: data['ImageItem'],
        PointItem: data['PointItem'],
        cashbackitem: data['cashbackitem'],
        nameItem: data['nameItem']);
  }
}
