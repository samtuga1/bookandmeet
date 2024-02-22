import 'package:bookandmeet/src/data/data.dart';
import 'package:bookandmeet/src/extensions/extensions.dart';
import 'package:bookandmeet/src/modules/shared/widgets/widgets.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpSwitcher extends StatefulWidget {
  const SignUpSwitcher({super.key});

  @override
  State<SignUpSwitcher> createState() => _SignUpSwitcherState();
}

class _SignUpSwitcherState extends State<SignUpSwitcher> {
  bool showClient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Durations.medium1,
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            final forward = child.key == Key(UserType.customer.name);

            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(forward ? -0.2 : 0.2, 0),
                end: Offset(0, 0),
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: showClient
              ? Padding(
                  key: Key(UserType.customer.name),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Info(UserType.customer),
                      _buttons(UserType.customer),
                    ],
                  ),
                )
              : Padding(
                  key: Key(UserType.business.name),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Info(UserType.business),
                      _buttons(UserType.business),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buttons(UserType type) {
    return Column(
      children: [
        AppButton(
          onPressed: () {
            if (showClient && type == UserType.customer) {
              Navigator.of(context).pushNamed(Routes.create_account,
                  arguments: UserType.customer);
              //
            } else if (!showClient && type == UserType.business) {
              Navigator.of(context).pushNamed(Routes.create_account,
                  arguments: UserType.business);
            } else {
              setState(() {
                showClient = false;
              });
            }
          },
          title: switch (showClient) {
            true => 'Continue',
            false => 'Sign up as a business',
          },
        ),
        13.verticalSpace,
        AppButton(
          addBorder: true,
          onPressed: () {
            if (showClient && type == UserType.customer) {
              setState(() {
                showClient = false;
              });
            } else if (!showClient && type == UserType.business) {
              setState(() {
                showClient = true;
              });
            } else {
              //
            }
          },
          title: switch (showClient) {
            true => 'Sign up as a business',
            false => 'Sign up as a customer',
          },
        ),
        10.verticalSpace,
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Go back'),
        ),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const _Info(this.user);
  final UserType user;

  @override
  Widget build(BuildContext context) {
    final details = switch (user) {
      UserType.customer => [
          (
            BoxIcons.bx_current_location,
            'Locate top-rated barbers, stylists, masseuses, and SPAs near you, all in one place.'
          ),
          (
            BoxIcons.bx_bookmark,
            'Secure your appointments effortlessly with our user-friendly booking feature.'
          ),
          (
            BoxIcons.bx_time,
            'Eliminate long waits and ensure your time is respected with efficient scheduling.'
          ),
        ],
      UserType.business => [
          (
            BoxIcons.bx_rocket,
            'Gain massive tractions to your business on bookandmeet'
          ),
          (
            Clarity.checkbox_list_line,
            'Manage all your appointments all in one place'
          ),
          (
            AntDesign.pie_chart_outline,
            'Grow your business seamlessly with bookandmeet',
          ),
        ],
    };

    return Column(
      children: [
        Text(
          switch (user) {
            UserType.customer => 'Join as a user on bookandmeet',
            UserType.business => 'Register your business on bookandmeet',
          },
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        30.verticalSpace,
        ...details
            .map(
              (item) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    item.$1,
                    size: 30.h,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      item.$2,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 25.h),
            )
            .toList(),
        20.verticalSpace,
      ],
    );
  }
}
