import 'package:e_shop/presentation/model/notification_model.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/views/home_view/Categories_view.dart';
import 'package:e_shop/presentation/views/home_view/cart_view.dart';
import 'package:e_shop/presentation/views/home_view/favorites_view.dart';
import 'package:e_shop/presentation/views/home_view/home_view.dart';
import 'package:e_shop/presentation/views/home_view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{
  HomeViewModel();

  List<Widget> homeViews = const [
    HomeView(),
    CategoriesView(),
    FavoritesView(),
    CartView(),
    ProfileView(),
  ];
  int _active = 0;
  int get active=>_active;
  void bottomNavigationChangeActiveItem(int newValue)
  {
    _active=newValue;
    notifyListeners();
  }

  List<Map<String,dynamic>> notification = [
    {'time':StringManager.today,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.today,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.today,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.yesterday,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.yesterday,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.yesterday,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
    {'time':StringManager.yesterday,'notification':NotificationModel(StringManager.notificationTitle,StringManager.notificationContent),},
  ];
}
