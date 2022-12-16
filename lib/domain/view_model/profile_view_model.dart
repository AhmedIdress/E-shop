import 'package:e_shop/consts/consts.dart';
import 'package:e_shop/data/data_provider/local/cache_helper.dart';
import 'package:e_shop/data/data_provider/remote/dio_helper.dart';
import 'package:e_shop/data/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel extends ChangeNotifier{
  ProfileModel? profileModel;
  ProfileViewModel(){
    getProfile();
  }
  String? token = CacheHelper.get(key: 'token');
  Future<void> getProfile() async {
    // print(token);
    var result = await DioHelper.getData(url: Consts.profile,token: token,);
    //print(result);
    profileModel = ProfileModel.fromJson(result.data);
    notifyListeners();
  }


}