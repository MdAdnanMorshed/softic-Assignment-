import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../global_widgets/custom_app_drawer.dart';

import '../../../init_first_controller/init_first_controller.dart';
import '../../../routes/app_pages.dart';
import '../../product_details/controllers/product_details_controller.dart';
import '../controllers/bottomnavigationbar_controller.dart';

class NavHomeScreen extends StatelessWidget {
  const NavHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(InitFirstController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Home',style: TextStyle(color: Colors.white),),),
        drawer: const CustomAppDrawer(),
        body: _buildSAllProducts(context, controller),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('NavHomeScreen.build');
              Get.toNamed(Routes.ADDPRODUCT);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  _buildSAllProducts(BuildContext context, InitFirstController controller) {
    return Obx(() {
      if (controller.homeAllProductList.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('product not found!')),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          child:

          ProductListWidget(productList: controller.homeAllProductList)
        );
      }
    });
  }
}

class ProductListWidget extends StatelessWidget {
  var productList;
  ProductListWidget({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Get.put(ProductDetailsController());
    var bottomNavCTR = Get.put(BottomNavigationbarController());
    return Container(
      color: Colors.grey.shade200,
      child: StaggeredGridView.countBuilder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    crossAxisCount: 6,
    itemCount: productList.length,
    itemBuilder: (context, index) {
      ProductModel pInfo = productList[index];
      return InkWell(
        onTap: () async {
          print('product details ');
          productDetails.productId.value = pInfo.id.toString();
          productDetails.productInfo.value = productList[index];
          print(productDetails.productInfo.value);
          Get.toNamed(Routes.PRODUCT_DETAILS);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        '${pInfo.image}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          pInfo.name.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Price :  ৳ ${pInfo.productPrice!.price}',
                                style: const TextStyle(
                                  color: Color(0xFFD81D4C),
                                  fontWeight: FontWeight.w500,
                                  height: 1.42,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print('pId :${pInfo.id.toString()}');
                                bottomNavCTR
                                    .productDeleteById(pInfo.id.toString());
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.delete_forever,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    staggeredTileBuilder: (int index) =>
        StaggeredTile.count(3, index.isOdd ? 3.9 : 3.6),
    crossAxisSpacing: 1.0,
    mainAxisSpacing: 2.0,
      ),
    );
  }



}
