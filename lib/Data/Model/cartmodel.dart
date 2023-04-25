class CartModel {
  String? proprice;
  String? procount;
  String? cartId;
  String? cartCustid;
  String? cartProid;
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

  CartModel(
      {this.proprice,
      this.procount,
      this.cartId,
      this.cartCustid,
      this.cartProid,
      this.proId,
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
      this.proDate});

  CartModel.fromJson(Map<String, dynamic> json) {
    proprice = json['proprice'];
    procount = json['procount'];
    cartId = json['cart_id'];
    cartCustid = json['cart_custid'];
    cartProid = json['cart_proid'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proprice'] = this.proprice;
    data['procount'] = this.procount;
    data['cart_id'] = this.cartId;
    data['cart_custid'] = this.cartCustid;
    data['cart_proid'] = this.cartProid;
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
    return data;
  }
}
