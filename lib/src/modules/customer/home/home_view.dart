import 'package:bookandmeet/src/data/images/images.dart';
import 'package:bookandmeet/src/modules/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        addBackButton: false,
        title: 'bookandmeet',
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 85,
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(AppImages.barbershop),
                  ),
                  Text('Hair saloons')
                ],
              ),
              separatorBuilder: (context, index) => 20.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }
}
