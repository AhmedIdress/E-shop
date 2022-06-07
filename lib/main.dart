import 'package:e_shop/presentation/resources/theme_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/on_boarding_view_model.dart';
import 'package:e_shop/presentation/view_model/search_filter_view_model.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:e_shop/presentation/views/on_boarding_view/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnBoardingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchFilterViewModel(),
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
        title: 'Flutter Demo',
        theme: ThemeManager.getAppThemeData(),
        home: const OnBoardingView(),
      ),
    );
  }
}
