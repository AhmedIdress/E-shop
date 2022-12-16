import 'package:flutter/material.dart';

class FavoriteViewModel with ChangeNotifier
{
  List<int> count = List.generate(10, (index) => 0);

  void countChangePlus(int index)
  {
    count[index]++;
    notifyListeners();
  }
  void countChangeMinus(int index)
  {
    if(count[index]<=0)
      {
        count[index]=0;
      }
    else{
      count[index]--;
    }

    notifyListeners();
  }


}
