import 'package:e_shop/consts/consts.dart';
import 'package:e_shop/data/data_provider/remote/dio_helper.dart';
import 'package:e_shop/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier{
  int _categoriesCarouselIndex = 0;
  int get categoriesCarouselIndex => _categoriesCarouselIndex;
  CategoryModel? categoryModel;
  CategoryViewModel(){
    getCategories();
  }
  void getCategories() async {
    var result = await DioHelper.getData(url: Consts.categories,);
    print(result.data);
    categoryModel=CategoryModel.fromJson(result.data,);
  }
  void categoriesCarouselChangeIndex(int index)
  {
    _categoriesCarouselIndex =index;
    notifyListeners();
  }
}