

class NewProductModel {
  int? cartItemProductId;
  int? cartItemProductVariantId;
  dynamic cartProductName;
  dynamic cartProductImage;
  var cartItemProductQuantity;
  dynamic cartItemProductPrice;
  dynamic cartItemTotalPrice;
  dynamic cartItemDiscountPerProduct;
  dynamic productStock;

  NewProductModel(
      {this.cartItemProductId,
        this.cartItemProductVariantId,
        this.cartItemProductQuantity,
        this.cartProductName,
        this.cartProductImage,
        this.cartItemProductPrice,
        this.cartItemTotalPrice,
        this.cartItemDiscountPerProduct,
        this.productStock
      });

  NewProductModel.fromJson(Map<String, dynamic> json) {
    cartItemProductId = json['cartItemProductId'];
    cartItemProductVariantId = json['cartItemProductVariantId'];
    cartItemProductQuantity = json['cartItemProductQuantity'];
    cartProductName = json['cartProductName'];
    cartProductImage = json['cartProductImage'];
    cartItemProductPrice = json['cartItemProductPrice'];
    cartItemTotalPrice = json['cartItemTotalPrice'];
    cartItemDiscountPerProduct = json['cartItemDiscountPerProduct'];
    productStock = json['productStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.cartItemProductId;
    data['cartItemProductVariantId'] = this.cartItemProductVariantId;

   // data['cartProductName'] = this.cartProductName;
   //data['cartProductImage'] = this.cartProductImage;

    data['cartItemProductQuantity'] = this.cartItemProductQuantity;
    data['cartItemProductPrice'] = this.cartItemProductPrice;
    data['cartItemTotalPrice'] = this.cartItemTotalPrice;
    data['cartItemDiscountPerProduct'] = this.cartItemDiscountPerProduct;
    return data;
  }

  Map<String, dynamic> toJsonOrder() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.cartItemProductId;
    data['cartItemProductVariantId'] = this.cartItemProductVariantId;

  //  data['cartProductName'] = this.cartProductName;
   // data['cartProductImage'] = this.cartProductImage;

    data['cartItemProductQuantity'] = this.cartItemProductQuantity;
    data['cartItemProductPrice'] = this.cartItemProductPrice;
    data['cartItemTotalPrice'] = this.cartItemTotalPrice;
    data['cartItemDiscountPerProduct'] = this.cartItemDiscountPerProduct;
    return data;
  }
}