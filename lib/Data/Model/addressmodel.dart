class AddressModel {
  String? addId;
  String? addCustid;
  String? addName;
  String? addCity;
  String? addStreet;
  String? addLat;
  String? addLong;

  AddressModel(
      {this.addId,
      this.addCustid,
      this.addName,
      this.addCity,
      this.addStreet,
      this.addLat,
      this.addLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addId = json['add_id'];
    addCustid = json['add_custid'];
    addName = json['add_name'];
    addCity = json['add_city'];
    addStreet = json['add_street'];
    addLat = json['add_lat'];
    addLong = json['add_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_id'] = this.addId;
    data['add_custid'] = this.addCustid;
    data['add_name'] = this.addName;
    data['add_city'] = this.addCity;
    data['add_street'] = this.addStreet;
    data['add_lat'] = this.addLat;
    data['add_long'] = this.addLong;
    return data;
  }
}
