import 'package:bookandmeet/src/modules/customer/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class CustomerIndexController {
  final currentPageIndex = signal(0);

  final pages = [
    CustomerHomeView(),
    Container(),
    Container(),
    Container(),
  ];

  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }
}
