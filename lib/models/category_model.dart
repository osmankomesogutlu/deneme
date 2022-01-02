class CategoryModel {
  late String id;
  late String categoryName;
  late String seoUrl;

  CategoryModel({
    required this.categoryName,
    required this.id,
    required this.seoUrl,
  });

  CategoryModel.fromMap(Map<String,dynamic> data){
    id = data["id"];
    categoryName = data["categoryName"];
    seoUrl = data["seoUrl"];
  }
}
