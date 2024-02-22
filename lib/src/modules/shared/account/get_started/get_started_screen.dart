import 'package:bookandmeet/src/data/images/images.dart';
import 'package:bookandmeet/src/extensions/extensions.dart';
import 'package:bookandmeet/src/modules/shared/widgets/widgets.dart';
import 'package:bookandmeet/l10n/l10n.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:bookandmeet/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef PainterColorsStatus = ({bool showFirst, bool showSecond});

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  late Uint8List clientImage;
  late Uint8List businessImage;

  int currentPage = 0;
  double buttonsHeight = 0;
  PainterColorsStatus painterColors = (showFirst: true, showSecond: false);

  late PageController pageviewController;

  @override
  void initState() {
    pageviewController = PageController()..addListener(pageListener);
    super.initState();
  }

  void writeImagesToMemory() async {
    clientImage =
        await Helpers.loadFromAsset<Uint8List>(AppImages.client_onboarding);
    businessImage =
        await Helpers.loadFromAsset<Uint8List>(AppImages.client_onboarding);
  }

  void pageListener() {
    currentPage = pageviewController.page!.round();

    // this will determine which painter color to show
    // to prevent a weird behaviour
    painterColors = switch (currentPage) {
      0 => (showFirst: true, showSecond: false),
      1 => (showFirst: false, showSecond: true),
      _ => (showFirst: false, showSecond: false),
    };
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageviewController,
              children: [
                CustomPaint(
                  painter: _BackroundPainter1(context, painterColors),
                  child: _content(
                    title: 'Get inspired with bookandmeet',
                    content:
                        '#1 app to schedule appointments with any beauty service providers you can think of. \n Just a click away 😉',
                    iconPath: AppImages.client_onboarding,
                    translateContent: true,
                  ),
                ),
                CustomPaint(
                  painter: _BackroundPainter2(context, painterColors),
                  child: _content(
                    title: 'Grow your business now',
                    content:
                        'Sign up as a business merchant to find more clients, manage your business well and grow more tractions',
                    iconPath: AppImages.business_onboarding,
                    iconSize: Size(175, 175),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomMeasureWidgetSize(
                onChange: (size) {
                  buttonsHeight = size.height;
                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [0, null, 1]
                            .map((i) => switch (i) {
                                  null => 8.horizontalSpace,
                                  _ => AnimatedContainer(
                                      duration: Durations.short3,
                                      width: i == currentPage ? 30 : 15,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: i == currentPage
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).disabledColor,
                                      ),
                                    ),
                                })
                            .toList()),
                    20.verticalSpace,
                    Row(
                      children: [
                        Flexible(
                          child: AppButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              Routes.signUpSwitcher,
                            ),
                            title: l10n.signUp,
                          ),
                        ),
                        10.horizontalSpace,
                        Flexible(
                          child: AppButton(
                            addBorder: true,
                            onPressed: () {},
                            title: l10n.login,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content({
    required String title,
    required String content,
    required String iconPath,
    bool translateContent = false,
    Size iconSize = const Size(260, 260),
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: iconSize.width.w,
            height: iconSize.height.h,
          ),
          Transform.translate(
            offset: translateContent ? Offset(0, -50) : Offset.zero,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                5.verticalSpace,
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          buttonsHeight.verticalSpace,
        ],
      ).paddingSymmetric(horizontal: 20.w);
}

class _BackroundPainter1 extends CustomPainter {
  _BackroundPainter1(this.context, this.painterColor);

  final BuildContext context;
  PainterColorsStatus painterColor;

  @override
  void paint(Canvas canvas, Size size) {
    final blueCircle = Rect.fromCircle(
      center: Offset((size.width / 2) - (size.width / 2.2), size.height / 30),
      radius: size.width / 3.5,
    );

    final redCircle = Rect.fromCircle(
      center: Offset(
          (size.width + size.width * 0.1), size.height + (size.height * 0.1)),
      radius: size.width / 2.3,
    );

    _drawCircleGradient(
      canvas,
      blueCircle,
      Color(0xFFFFF8B9).withOpacity(0.8),
    );

    if (painterColor.showFirst)
      _drawCircleGradient(
        canvas,
        redCircle,
        Colors.deepPurple.withOpacity(0.5),
      );
  }

  _drawCircleGradient(Canvas canvas, Rect rect, Color color) {
    final paint = Paint()..color = color;

    // paint.imageFilter = ImageFilter.blur(
    //   sigmaX: 100,
    //   sigmaY: 100,
    //   tileMode: TileMode.decal,
    // );

    canvas.drawCircle(rect.center, rect.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _BackroundPainter2 extends CustomPainter {
  _BackroundPainter2(this.context, this.painterColor);

  PainterColorsStatus painterColor;

  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    final redCircle = Rect.fromCircle(
      center: Offset(size.width * 0.1, size.height + (size.height * 0.1)),
      radius: size.width / 2.3,
    );

    if (painterColor.showSecond) {
      final paint = Paint()..color = Colors.deepPurple.withOpacity(0.5);
      canvas.drawCircle(redCircle.center, redCircle.width / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
