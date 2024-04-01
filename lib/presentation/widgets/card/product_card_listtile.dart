import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratest/data/model/product/product_model.dart';

class ProductCardListtile extends StatelessWidget {
  const ProductCardListtile({super.key, required this.datalist});
  final List<ProductModel> datalist;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: datalist.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 130,
              child: Row(
                children: [
                  Image.network(
                    datalist[index].image,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(datalist[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('USD ${datalist[index].price.toString()}'),
                        const SizedBox(
                          height: 4,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.orangeAccent,),
                            Text('4.4'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('120 views')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
