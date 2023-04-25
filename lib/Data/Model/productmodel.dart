class ProductModel {
  String? proId;
  String? proCat;
  String? proName;
  String? proNameAr;
  String? proDesc;
  String? proDescAr;
  String? proImage;
  String? proPrice;
  String? proActive;
  String? proQty;
  String? proOffer;
  String? proDate;
  String? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catDate;
  String? favorite;
  String? discount;

  ProductModel(
      {this.proId,
      this.proCat,
      this.proName,
      this.proNameAr,
      this.proDesc,
      this.proDescAr,
      this.proImage,
      this.proPrice,
      this.proActive,
      this.proQty,
      this.proOffer,
      this.proDate,
      this.catId,
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catDate,
      this.favorite,
      this.discount});

  ProductModel.fromJson(Map<String, dynamic> json) {
    proId = json['pro_id'];
    proCat = json['pro_cat'];
    proName = json['pro_name'];
    proNameAr = json['pro_name_ar'];
    proDesc = json['pro_desc'];
    proDescAr = json['pro_desc_ar'];
    proImage = json['pro_image'];
    proPrice = json['pro_price'];
    proActive = json['pro_active'];
    proQty = json['pro_qty'];
    proOffer = json['pro_offer'];
    proDate = json['pro_date'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDate = json['cat_date'];
    favorite = json['favorite'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pro_id'] = this.proId;
    data['pro_cat'] = this.proCat;
    data['pro_name'] = this.proName;
    data['pro_name_ar'] = this.proNameAr;
    data['pro_desc'] = this.proDesc;
    data['pro_desc_ar'] = this.proDescAr;
    data['pro_image'] = this.proImage;
    data['pro_price'] = this.proPrice;
    data['pro_active'] = this.proActive;
    data['pro_qty'] = this.proQty;
    data['pro_offer'] = this.proOffer;
    data['pro_date'] = this.proDate;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_name_ar'] = this.catNameAr;
    data['cat_image'] = this.catImage;
    data['cat_date'] = this.catDate;
    return data;
  }
}
