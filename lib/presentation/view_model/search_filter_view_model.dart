import 'package:e_shop/presentation/model/filter_chip_model.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

class SearchFilterViewModel with ChangeNotifier {
  final List<FilterChipModel> _categoryFilterModel = [];
  List<Widget> _categoryFilterChips = [];
  final List<FilterChipModel> _sizesFilterModel = [];
  List<Widget> _sizesFilterChips = [];
  final List<FilterChipModel> _sortedByFilterModel = [];
  List<Widget> _sortedByFilterChips = [];
  int _sliderValue=100;
  int get sliderValue =>_sliderValue;
  RangeValues _sliderRangeValues=const RangeValues(100,500);
  RangeValues get sliderRangeValues =>_sliderRangeValues;
  rateCheck? filterRate;
  SearchFilterViewModel() {
    for (int i = 0; i < StringManager.categoryFilter.length; i++) {
      _categoryFilterModel.add(
        FilterChipModel(StringManager.categoryFilter[i], false),
      );
    }
    for (int i = 0; i < StringManager.sizeFilter.length; i++) {
      _sizesFilterModel.add(
        FilterChipModel(StringManager.sizeFilter[i], false),
      );
    }
    for (int i = 0; i < StringManager.sortedBy.length; i++) {
      _sortedByFilterModel.add(
        FilterChipModel(StringManager.categoryFilter[i], false),
      );
    }
  }
  List<Widget> categoryChips()
  {
    _categoryFilterChips=[];
    for (int i = 0; i < _categoryFilterModel.length; i++) {
      Widget item = FilterChip(
        selectedColor: ColorManager.primaryColor,
        selected:_categoryFilterModel[i].isSelected ,
        side: BorderSide(
          width: 0.5,
          color: ColorManager.filterBorder,
        ),
        backgroundColor: ColorManager.white,
        label: Text(
          _categoryFilterModel[i].filterName,
          style: TextStyleManager.getMediumTextStyle(
            color: _categoryFilterModel[i].isSelected? ColorManager.white: ColorManager.bottomNavigationTextColor,
            fontSize: FontSizeManager.s10,
          ),
        ),
        onSelected: (bool value) {
          _categoryFilterModel[i].isSelected=value;
          notifyListeners();
        },
      );
      _categoryFilterChips.add(
        item
      );
    }
    return _categoryFilterChips;
  }

  List<Widget> sizesChips()
  {
    _sizesFilterChips=[];
    for (int i = 0; i < _sizesFilterModel.length; i++) {
      Widget item = FilterChip(
        selectedColor: ColorManager.primaryColor,
        selected:_sizesFilterModel[i].isSelected ,
        side: BorderSide(
          width: 0.5,
          color: ColorManager.filterBorder,
        ),
        backgroundColor: ColorManager.white,
        label: Text(
          _sizesFilterModel[i].filterName,
          style: TextStyleManager.getMediumTextStyle(
            color: _sizesFilterModel[i].isSelected? ColorManager.white: ColorManager.bottomNavigationTextColor,
            fontSize: FontSizeManager.s10,
          ),
        ),
        onSelected: (bool value) {
          _sizesFilterModel[i].isSelected=value;
          notifyListeners();
        },
      );
      _sizesFilterChips.add(
        item
      );
    }
    return _sizesFilterChips;
  }

  List<Widget> sortedByChips()
  {
    _sortedByFilterChips=[];
    for (int i = 0; i < _sortedByFilterModel.length; i++) {
      Widget item = FilterChip(
        selectedColor: ColorManager.primaryColor,
        selected:_sortedByFilterModel[i].isSelected ,
        side: BorderSide(
          width: 0.5,
          color: ColorManager.filterBorder,
        ),
        backgroundColor: ColorManager.white,
        label: Text(
          _sortedByFilterModel[i].filterName,
          style: TextStyleManager.getMediumTextStyle(
            color: _sortedByFilterModel[i].isSelected? ColorManager.white: ColorManager.bottomNavigationTextColor,
            fontSize: FontSizeManager.s10,
          ),
        ),
        onSelected: (bool value) {
          _sortedByFilterModel[i].isSelected=value;
          notifyListeners();
        },
      );
      _sortedByFilterChips.add(
        item
      );
    }
    return _sortedByFilterChips;
  }
  void changeSlider(int value)
  {
    _sliderValue=value;
    notifyListeners();
  }
  void changeSliderRangeValues(RangeValues value)
  {
    _sliderRangeValues=value;
    notifyListeners();
  }
  void checkRateValue(rateCheck rate)
  {
    filterRate = rate;
    notifyListeners();
  }
}

enum rateCheck{
  five,four,there,two,
}