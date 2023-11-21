import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:businessregapp/core/app_export.dart';
import 'package:businessregapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    CustomElevatedButton(text: "lbl_my_merchants".tr),
                    CustomImageView(
                        imagePath: ImageConstant.imgDreamshaperV7,
                        height: 250.v,
                        width: 363.h),
                    Container(
                        decoration: AppDecoration.outlineBlack,
                        child: Text("lbl_welcome".tr,
                            style: theme.textTheme.headlineLarge)),
                    SizedBox(height: 29.v),
                    SizedBox(
                        width: 257.h,
                        child: Text("msg_our_aim_is_to_assist".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyLargeOnPrimary_1
                                .copyWith(height: 1.50))),
                    SizedBox(height: 36.v),
                    CustomElevatedButton(
                        height: 56.v,
                        text: "lbl_continue".tr,
                        margin: EdgeInsets.symmetric(horizontal: 16.h),
                        buttonStyle: CustomButtonStyles.fillOnPrimary,
                        buttonTextStyle: theme.textTheme.titleMedium!,
                        onPressed: () {
                          onTapContinue(context);
                        }),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
