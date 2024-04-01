import 'package:flutter/material.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data, required this.homectrl});
  final List<ProductModel> data;
  final HomeProductController homectrl;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 300,
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 5.0,
        ),
        padding: const EdgeInsets.all(8.0), 
        itemCount: data.length, 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              homectrl.gotoDetailProduct(productModel: data[index]);
            },
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  Image.network(data[index].image, width: 100, height: 170,),
                  const SizedBox(
                    height: 4,
                  ),
                   Text( data[index].title,overflow: TextOverflow.ellipsis, maxLines: 2, style: const TextStyle(fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 4,
                  ),
                   Text('USD ${data[index].price.toString()}'),
                  const SizedBox(
                    height: 4,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange,),
                      Text('4.4'),
                      SizedBox(
                        width: 5,
                      ),
                      Text('120 views')
                    ],
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
