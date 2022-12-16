import 'package:e_shop/consts/consts.dart';
import 'package:e_shop/data/data_provider/remote/dio_helper.dart';
import 'package:e_shop/data/model/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewModel extends ChangeNotifier{
  late RegisterModel model;
  bool visiblePassword = false;
  Future<void> postUser(RegisterUserData data)async{
    DioHelper.postData(url: Consts.register, data: data.toJson(),).then((value) {
      model = RegisterModel.fromJson(value.data);
      ///check status
      Fluttertoast.showToast(msg: model.message.toString(),);
    }).catchError((error){

    });

    notifyListeners();
  }

  void changePasswordVisible (){
    visiblePassword = !visiblePassword;
    notifyListeners();
  }
}