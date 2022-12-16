import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/views/on_boarding_view/on_boarding_page_content.dart';
import 'package:flutter/material.dart';

class OnBoardingViewModel with ChangeNotifier{
  final List<OnBoardingPageContent> onBoardingPages = [
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage1,
      title: StringManager.onBoardingTitle1,
      subtitle: StringManager.onBoardingSubTitle1,
    ),
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage2,
      title: StringManager.onBoardingTitle2,
      subtitle: StringManager.onBoardingSubTitle2,
    ),
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage3,
      title: StringManager.onBoardingTitle3,
      subtitle: StringManager.onBoardingSubTitle3,
    ),
  ];
  final PageController controller = PageController();
  int activePage = 0;
void nextPage()
{
  controller.nextPage(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.ease);
  notifyListeners();
}
void activePageChange(int index)
{
  activePage=index;
  notifyListeners();
}
}