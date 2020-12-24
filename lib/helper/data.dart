import "package:flutter_news/models/category_models.dart";

List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>();

  CategoryModel categoryModel1 = CategoryModel();
  categoryModel1.categoryName = "General";
  categoryModel1.imageUrl =
      "https://images.unsplash.com/photo-1560177112-fbfd5fde9566?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel1);

  CategoryModel categoryModel2 = CategoryModel();
  categoryModel2.categoryName = "Entertainment";
  categoryModel2.imageUrl =
      "https://images.unsplash.com/photo-1581320465488-c3c2edaa893d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel2);

  CategoryModel categoryModel3 = CategoryModel();
  categoryModel3.categoryName = "Health";
  categoryModel3.imageUrl =
      "https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel3);

  CategoryModel categoryModel4 = CategoryModel();
  categoryModel4.categoryName = "Science";
  categoryModel4.imageUrl =
      "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel4);

  CategoryModel categoryModel5 = CategoryModel();
  categoryModel5.categoryName = "Sports";
  categoryModel5.imageUrl =
      "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel5);

  CategoryModel categoryModel6 = CategoryModel();
  categoryModel6.categoryName = "Technology";
  categoryModel6.imageUrl =
      "https://images.unsplash.com/photo-1483478550801-ceba5fe50e8e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel6);

  CategoryModel categoryModel7 = CategoryModel();
  categoryModel7.categoryName = "Business";
  categoryModel7.imageUrl =
      "https://images.unsplash.com/photo-1593642634367-d91a135587b5?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel7);

  return category;
}
