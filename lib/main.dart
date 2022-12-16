import 'package:e_shop/data/data_provider/local/cache_helper.dart';
import 'package:e_shop/data/data_provider/remote/dio_helper.dart';
import 'package:e_shop/domain/view_model/authintication/favorite_view_model.dart';
import 'package:e_shop/domain/view_model/authintication/login_view_model.dart';
import 'package:e_shop/domain/view_model/authintication/register_view_model.dart';
import 'package:e_shop/domain/view_model/category_view_model.dart';
import 'package:e_shop/domain/view_model/home_view_model.dart';
import 'package:e_shop/domain/view_model/on_boarding_view_model.dart';
import 'package:e_shop/domain/view_model/profile_view_model.dart';
import 'package:e_shop/domain/view_model/search_filter_view_model.dart';
import 'package:e_shop/presentation/resources/theme_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/connect_check/connect_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnBoardingViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => SearchFilterViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryViewModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteViewModel(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppSizeManager.sWidth,
        AppSizeManager.sHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context) => MaterialApp(
        title: 'Flutter E-shop',
        home: const ConnectChick(),
        theme: ThemeManager.getAppThemeData(),
      ),
    );
  }
}
