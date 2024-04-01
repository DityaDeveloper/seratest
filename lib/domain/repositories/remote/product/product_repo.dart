// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:seratest/data/datasource/product/product_datasource.dart';
import 'package:seratest/data/model/category/category_model.dart';
import 'package:seratest/data/model/product/product_model.dart';

class ProductRepository {
     Future<List<ProductModel>> getProductList()async{
     final productDatasource = ProductDatasource();
     final response = await productDatasource.getProduct();
     if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['metadata'];
        List<ProductModel> data =  parsed.map((i) => ProductModel.fromJson(i)).toList();
      return data;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];
      }
  }
     Future<List<CategoryModel>> getProductCategoryList()async{
     final productDatasource = ProductDatasource();
     final response = await productDatasource.getProductCategory();
     if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
        print(response);
        List<dynamic> parsed =  response['metadata'];
        List<CategoryModel> data =  parsed.map((i) => CategoryModel(categoryname: i)).toList();
      return data;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];
      }
  }

  Future<bool> addToCart(Map requestbody)async{
     final productDatasource = ProductDatasource();
     final response = await productDatasource.addcart(requestbody);
      if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
      return Future.value(true);
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return Future.value(false);
      }
  }

     Future<List<ProductModel>> getProductCartList(String uid)async{
     final productDatasource = ProductDatasource();
     final response = await productDatasource.getProductCart(uid);
     if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
        print(response);
        List<dynamic> parsed =  response['metadata'][0]['products'];
        List<ProductModel> data =  parsed.map((i) => ProductModel.fromJson(i)).toList();
      return data;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];
      }
  }
}