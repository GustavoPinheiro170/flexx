import 'package:flutter/material.dart';

class LoadingController extends ChangeNotifier{
  
  static LoadingController instance = LoadingController();

  bool isLoading = true;

  changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

}