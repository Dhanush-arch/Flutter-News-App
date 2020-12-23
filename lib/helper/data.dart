import "package:flutter_news/models/category_models.dart";

List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>();

  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.imageUrl = "";

  category.add(categoryModel);

  return category;
}
