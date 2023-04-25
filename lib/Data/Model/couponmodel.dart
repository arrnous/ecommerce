class CouponModel {
  String? copId;
  String? copName;
  String? copCount;
  String? copDiscount;
  String? copExpiredate;

  CouponModel(
      {this.copId,
      this.copName,
      this.copCount,
      this.copDiscount,
      this.copExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    copId = json['cop_id'];
    copName = json['cop_name'];
    copCount = json['cop_count'];
    copDiscount = json['cop_discount'];
    copExpiredate = json['cop_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cop_id'] = this.copId;
    data['cop_name'] = this.copName;
    data['cop_count'] = this.copCount;
    data['cop_discount'] = this.copDiscount;
    data['cop_expiredate'] = this.copExpiredate;
    return data;
  }
}
