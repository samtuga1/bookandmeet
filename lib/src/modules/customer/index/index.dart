import 'package:bookandmeet/src/modules/customer/index/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:signals/signals_flutter.dart';

class CustomerIndex extends StatelessWidget {
  CustomerIndex({super.key});

  final controller = CustomerIndexController();

  @override
  Widget build(BuildContext context) {
    return Watch.builder(
      builder: (context) {
        return Scaffold(
          body: IndexedStack(
            children: controller.pages,
            index: controller.currentPageIndex.value,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentPageIndex.value,
            onTap: controller.changePageIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(EvaIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(BoxIcons.bx_search_alt),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(BoxIcons.bx_calendar),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(OctIcons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
