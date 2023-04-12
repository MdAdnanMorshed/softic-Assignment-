class AddProductModel {
  String? name;
  String? barcode;
  String? description;
  //String? image;
  int? subCategory;
  int? brand;
  Quantity? quantity;
  ProductPrice? productPrice;

  AddProductModel(
      {this.name,
        this.barcode,
        this.description,
       // this.image,
        this.subCategory,
        this.brand,
        this.quantity,
        this.productPrice});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    barcode = json['barcode'];
    description = json['description'];
   // image = json['image'];
    subCategory = json['subCategory'];
    brand = json['brand'];
    quantity = json['quantity'] != null
        ? new Quantity.fromJson(json['quantity'])
        : null;
    productPrice = json['productPrice'] != null
        ? new ProductPrice.fromJson(json['productPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name!;
    data['barcode'] = this.barcode!;
    data['description'] = this.description;
   // data['image'] = this.image;
    data['subCategory'] = this.subCategory;
    data['brand'] = this.brand;
    if (this.quantity != null) {
      data['quantity'] = this.quantity!.toJson();
    }
    if (this.productPrice != null) {
      data['productPrice'] = this.productPrice!.toJson();
    }
    return data;
  }
}

class Quantity {
  int? quantity;
  String? unit;
  String? unitValue;
  int? pastQuantity;

  Quantity({this.quantity, this.unit, this.unitValue, this.pastQuantity});

  Quantity.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    unit = json['unit'];
    unitValue = json['unitValue'];
    pastQuantity = json['pastQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['unitValue'] = this.unitValue;
    data['pastQuantity'] = this.pastQuantity;
    return data;
  }
}

class ProductPrice {
  int? price;
  int? unitPrice;
  int? mrp;

  ProductPrice({this.price, this.unitPrice, this.mrp});

  ProductPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    unitPrice = json['unitPrice'];
    mrp = json['mrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['unitPrice'] = this.unitPrice;
    data['mrp'] = this.mrp;
    return data;
  }
}