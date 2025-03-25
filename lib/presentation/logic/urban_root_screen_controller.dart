import 'package:flutter/cupertino.dart';

class UrbanRootScreenController extends ChangeNotifier{


  UrbanRootScreenController(){
    init();
  }

  Future<void> init() async
  {
    selectedIndex.value = 0;
  }

   ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final PageController pageController = PageController();

  void jumpToPage(int index) {
    pageController.jumpToPage(index);
  }

}