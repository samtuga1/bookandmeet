import 'package:bookandmeet/src/extensions/widget_extensions.dart';
import 'package:bookandmeet/src/modules/shared/widgets/widgets.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  // late String reference;

  @override
  void didChangeDependencies() {
    // reference = ModalRoute.of(context)?.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            34.verticalSpace,
            BackButton().paddingOnly(left: 20),
            24.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      'Verify your email address',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    16.verticalSpace,
                    Text(
                      'Enter the 4 digit code sent to your samueltwumasi1290@gmail.com',
                      textAlign: TextAlign.center,
                    ),
                    24.verticalSpace,
                    Center(
                      child: PinInputField(
                        length: 4,
                        onFocusChange: (hasFocus) async {},
                        onChanged: (value) {},
                      ),
                    ),
                    24.verticalSpace,
                    AppButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.welcome, (route) => false);
                      },
                      title: 'Verify phone number',
                    ),
                    5.verticalSpace,
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Didn’t get a code?',
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('Resend'),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
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
