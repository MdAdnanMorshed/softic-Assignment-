
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:iv/app/data/models/product_model.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../global_widgets/app_space.dart';

import '../../../global_widgets/key_value_widget.dart';

import '../../../routes/app_pages.dart';
import '../../bottomnavigationbar/controllers/bottomnavigationbar_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({Key? key}) : super(key: key);
  final pDetailsCTR = Get.put(BottomNavigationbarController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:
      Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Obx(() {
          ProductModel productInfo1 = controller.productInfo.value;
       return   _buildProductDetail(context, productInfo1);
        }),
      ),
    );
  }

  _buildProductDetail(context, ProductModel productInfo) {
    ProductPrice? price= productInfo.productPrice;
    Category? category= productInfo.brand;
    SubCategory? subCategory= productInfo.subCategory;
    Quantity? qtyInfo= productInfo.quantity;
    ProductPrice? pPriceInfo= productInfo.productPrice;

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBarWidget('Product Details',isBackButton: true),
          ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              detailsProductImage(context, productInfo),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: Get.width/2+20,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),

                    child:Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 12.0),
                        child:  Text(
                          ' ৳ ' +price!.price.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFD81D4C),
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text(
                          productInfo.name.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                            height: 1.44,
                          ),
                        ),
                      ),
                        AppSpace.spaceH16,
                        KeyValueWidget('Category Name',category!.name.toString()),
                        KeyValueWidget('Sub Category Name',subCategory!.name.toString()),

                    ],)
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity Summery  ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                  ),

                  productQtySummeryView(qtyInfo!),


                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price Summery ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                  ),

                  productPriceSummeryView(pPriceInfo!),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ProductDescription'.tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: CtmColors.appColor,
                            //const Color(0xFF021E65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                  ),
                  AppSpace.spaceH16,

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(width: double.infinity,
                       // height: 100,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child:HtmlWidget('${productInfo.description.toString()}'))

                  ),

                  AppSpace.spaceH16,

                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  detailsProductImage(BuildContext context, ProductModel productInfo) {
    return

      productInfo.image==''?
      Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 200,
      child: CarouselSlider.builder(
        itemCount: 1,
        slideBuilder: (index) {
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Image.network(
              productInfo.image.toString(),
              fit: BoxFit.fitWidth,
            ),
          );
        },
        slideTransform: CubeTransform(),
        slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 12),
            indicatorRadius: 4,
            itemSpacing: 12,
            currentIndicatorColor: Colors.red,
            indicatorBackgroundColor: Colors.grey),
      ),
    ) :Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        height: 250,
        child: CarouselSlider.builder(
          itemCount: 1,
          slideBuilder: (index) {
            return Container(

             // width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(100)),
              child: Image.network(
                productInfo.image.toString(),
                fit: BoxFit.contain,
              ),
            );
          },
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 12),
              indicatorRadius: 4,
              itemSpacing: 12,
              currentIndicatorColor: Colors.red,
              indicatorBackgroundColor: Colors.grey),
        ),
      );
  }

  productDescriptionSpecification() {
    return DefaultTabController(
        length: 2,
        child: Container(
          height: 100,
          width: 300,
          color: Colors.greenAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_car)),

                ],
              ),
              TabBarView(
                children: [
                  Text('Description here Details '),
                  Text('Specification Here Details')
                ],
              ),
            ],
          ),
        ));
  }

  productQtySummeryView(Quantity qtyInfo){
    return  Container(
      height: Get.width/3,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          KeyValueWidget('Quantity',qtyInfo.quantity.toString()),
          KeyValueWidget('Unit',qtyInfo.unit.toString()),
          KeyValueWidget('Unit Value',qtyInfo.unitValue.toString()),
          KeyValueWidget('Past Quantity',qtyInfo.pastQuantity.toString()),

        ],),

    );
  }

  productPriceSummeryView(ProductPrice pPrice){
    return  Container(
      height: Get.width/3,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          KeyValueWidget('Price',pPrice.price.toString()),
          KeyValueWidget('Unit Price',pPrice.unitPrice.toString()),
          KeyValueWidget('MRP Price',pPrice.mrp.toString()),



        ],),

    );
  }

}

class CustomAppBarWidget extends StatelessWidget {
  String appBarTitle;
  bool isBackButton = false;

  CustomAppBarWidget(this.appBarTitle, { this.isBackButton=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey[100],
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isBackButton?
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);
              },
              icon: const Icon(Icons.arrow_back_rounded)):Container(margin: EdgeInsets.only(left: 10),),
          Text(appBarTitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

