import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child:  GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 300,
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 5.0,
        ),
        padding: const EdgeInsets.all(8.0), 
        itemCount: 6, 
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green[500],
                  radius: 45,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                    radius: 35,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text('Product name'),
                const SizedBox(
                  height: 4,
                ),
                const Text('USD 4.4'),
                const SizedBox(
                  height: 4,
                ),
                const Row(
                  children: [
                    Icon(Icons.star),
                    Text('4.4'),
                    SizedBox(
                      width: 5,
                    ),
                    Text('120 views')
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
