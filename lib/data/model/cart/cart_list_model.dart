import 'cart_model.dart';


class CartListModel {
  final List<CartModel> list;

  CartListModel({
    required this.list,
  });

  factory CartListModel.fromJson(List<dynamic> parsedJson) {
    List<CartModel> list = <CartModel>[];
    list = parsedJson.map((i) => CartModel.fromJson(i)).toList();

    return CartListModel(list: list);
  }
}
