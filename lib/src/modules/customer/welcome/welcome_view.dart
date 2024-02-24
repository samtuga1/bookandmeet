import 'package:bookandmeet/src/data/images/images.dart';
import 'package:bookandmeet/src/extensions/extensions.dart';
import 'package:bookandmeet/src/modules/shared/widgets/widgets.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerWelcomeView extends StatelessWidget {
  const CustomerWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          60.verticalSpace,
          Text(
            'Welcome to bookandmeet!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Image.asset(AppImages.barbershop),
          ),
          15.verticalSpace,
          Text(
            'You can now discover and make appointments with exculsive barbershops, hair saloons, nail saloons, massage therapists and many more...',
          ),
          Spacer(),
          AppButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(Routes.customerIndex),
            title: "Let's go",
          ),
          40.verticalSpace,
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
