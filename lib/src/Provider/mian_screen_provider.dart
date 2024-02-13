import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier{
  int _indexPage = 0;


  int get() => _indexPage;

  set(int page) { 
    _indexPage = page;
    notifyListeners();
  }


  
}