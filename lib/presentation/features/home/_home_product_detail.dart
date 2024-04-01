// ignore_for_file: use_key_in_widget_constructors

part of 'home_view.dart';

class HomeProductDetail extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "shop IT",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: Get.height * .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(children: [
                 Image.network(
                  arguments.image,
                  width: 150,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'USD ${arguments.price.toString()}',
                      style: const TextStyle(
                          color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                ),
                Text(
                  arguments.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text('4.4'),
                    SizedBox(
                      width: 5,
                    ),
                    Text('120 views'),
                  ],
                ),
                const Text('lorem...'),
               ],),
            
                SizedBox(
                  child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: (){
                              controller.addProductToCart(productModel: arguments);
                            },
                            child:  const Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.white),
                              ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
