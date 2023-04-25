class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryDatetime;

  CategoryModel(
      {this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.categoryDatetime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['cat_id'];
    categoryName = json['cat_name'];
    categoryNameAr = json['cat_name_ar'];
    categoryImage = json['cat_image'];
    categoryDatetime = json['cat_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['cat_id'] = this.categoryId;
    data['cat_name'] = this.categoryName;
    data['cat_name_ar'] = this.categoryNameAr;
    data['cat_image'] = this.categoryImage;
    data['cat_datetime'] = this.categoryDatetime;

    return data;
  }
}
