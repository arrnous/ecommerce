class MyFavoriteModel {
  String? favId;
  String? favCustid;
  String? favProid;
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
  String? custId;

  MyFavoriteModel(
      {this.favId,
      this.favCustid,
      this.favProid,
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
      this.proDate,
      this.custId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favId = json['fav_id'];
    favCustid = json['fav_custid'];
    favProid = json['fav_proid'];
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
    custId = json['cust_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fav_id'] = this.favId;
    data['fav_custid'] = this.favCustid;
    data['fav_proid'] = this.favProid;
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
    data['cust_id'] = this.custId;
    return data;
  }
}
