import 'package:e_shop/consts/consts.dart';
import 'package:e_shop/data/data_provider/local/cache_helper.dart';
import 'package:e_shop/data/data_provider/remote/dio_helper.dart';
import 'package:e_shop/data/model/login_model.dart';
import 'package:e_shop/data/model/logout_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginModel model;
  LogoutModel? logoutModel;
  bool visiblePassword = false;
  bool rememberMy = false;
  String? token;
  LoginViewModel(){
    token = CacheHelper.get(
      key: 'token',
    );
  }
  Future<void> postUser(LoginUserData data) async {
    DioHelper.postData(
      url: Consts.login,
      data: data.toJson(),
    ).then((value) {
      model = LoginModel.fromJson(value.data);

      ///check status
      if(rememberMy){
        CacheHelper.put(
          key: 'remember',
          value: true,
        );
      }
      CacheHelper.put(
        key: 'token',
        value: model.data?.token,
      );
      token = CacheHelper.get(
        key: 'token',
      );

      Fluttertoast.showToast(
        msg: model.message.toString(),
      );
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });

    notifyListeners();
  }

  void changePasswordVisible() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  void changeRememberMyState() {
    rememberMy = !rememberMy;
    notifyListeners();
  }

  Future<void> logOut() async {
    /*if (kDebugMode) {
      print(token);
    }*/
    DioHelper.postData(
      url: Consts.logout,
      data: {
        'fcm_token': token,
      },
      token: token,
    ).then((value) {
      logoutModel = LogoutModel.fromJson(value.data);
      rememberMy=false;
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'remember');
      Fluttertoast.showToast(
        msg: logoutModel?.message.toString()??"",
      );
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });
    notifyListeners();
  }
}
