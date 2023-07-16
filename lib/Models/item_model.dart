import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String? id;
  final String? ImageItem;
  final String? Price;
  final String? descrption;
  final String? feedback_star;
  final String? nameItem;

  const ItemModel({
    this.id,
    required this.ImageItem,
    required this.Price,
    required this.descrption,
    required this.feedback_star,
    required this.nameItem,
  });

  toJson() {
    return {
      'ImageItem': ImageItem,
      'Price': Price,
      'descrption': descrption,
      'feedback_star': feedback_star,
      'nameItem': nameItem,
    };
  }

  factory ItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ItemModel(
        id: document.id,
        ImageItem: data['ImageItem'],
        Price: data['Price'],
        descrption: data['descrption'],
        feedback_star: data['feedback_star'],
        nameItem: data['nameItem']);
  }
}
