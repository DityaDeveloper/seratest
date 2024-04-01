import 'product_model.dart';


class ProductListModel {
  final List<ProductModel> list;

  ProductListModel({
    required this.list,
  });

  factory ProductListModel.fromJson(List<dynamic> parsedJson) {
    List<ProductModel> list = <ProductModel>[];
    list = parsedJson.map((i) => ProductModel.fromJson(i)).toList();

    return ProductListModel(list: list);
  }
}
