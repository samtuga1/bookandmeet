import 'package:bookandmeet/src/extensions/extensions.dart';
import 'package:bookandmeet/src/modules/shared/widgets/widgets.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 64.h),
          children: [
            Form(
              // key: createAccountController.formKey,
              // autovalidateMode: createAccountController.autoValidateMode,
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create account',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 25,
                          ),
                    ),
                    30.verticalSpace,
                    Text(
                      'Email address',
                      // style: AppTextStyles.labelStyle,
                    ),
                    8.verticalSpace,
                    CustomTextField(
                      hintText: 'Enter email address',
                    ),
                    30.verticalSpace,
                    AppButton(
                      title: "Get started",
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Routes.verifyOtp),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Already have an account?',
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: Text('Login'),
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text('or').paddingSymmetric(horizontal: 10),
                        Expanded(child: Divider())
                      ],
                    ),
                    40.verticalSpace,
                    AppButton(
                      addBorder: true,
                      onPressed: () {},
                      child: SizedBox(
                        height: 23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Brand(Brands.google, size: 23.h),
                            12.horizontalSpace,
                            Text('Sign up with Google')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
