import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCartListtileShimmer extends StatelessWidget {
  const ProductCartListtileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) => const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: Text('Dummy Card')),
              ),
            ),
          )),
    );
  }
}
