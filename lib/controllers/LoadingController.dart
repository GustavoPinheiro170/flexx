import 'package:flutter/material.dart';

class LoadingController extends ChangeNotifier{
  
  static LoadingController instance = LoadingController();

  bool isLoading = false;

  changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

}