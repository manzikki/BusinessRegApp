import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:businessregapp/core/app_export.dart';
import 'package:businessregapp/core/utils/validation_functions.dart';
import 'package:businessregapp/widgets/custom_elevated_button.dart';
import 'package:businessregapp/widgets/custom_outlined_button.dart';
import 'package:businessregapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:businessregapp/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildMyMerchantsButton(context),
                      SizedBox(height: 75.v),
                      Text("lbl_welcome".tr,
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 15.v),
                      Container(
                          width: 291.h,
                          margin: EdgeInsets.only(left: 42.h, right: 41.h),
                          child: Text("msg_our_aim_is_to_assist".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyLargeOnPrimary_1
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 69.v),
                      _buildEmailEditText(context),
                      SizedBox(height: 14.v),
                      _buildPasswordEditText(context),
                      SizedBox(height: 24.v),
                      _buildSignInButton(context),
                      SizedBox(height: 23.v),
                      _buildSignInWithGoogleButton(context),
                      Spacer(),
                      SizedBox(height: 53.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 64.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: CustomTextStyles
                                                .bodyLargeOnPrimary),
                                        TextSpan(
                                            text: "lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .bodyLargeOnPrimary
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline))
                                      ]),
                                      textAlign: TextAlign.left))))
                    ])))));
  }

  /// Section Widget
  Widget _buildMyMerchantsButton(BuildContext context) {
    return CustomElevatedButton(text: "lbl_my_merchants".tr);
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 13.h),
        child: BlocSelector<LoginBloc, LoginState, TextEditingController?>(
            selector: (state) => state.emailEditTextController,
            builder: (context, emailEditTextController) {
              return CustomTextFormField(
                  controller: emailEditTextController,
                  hintText: "lbl_email".tr,
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgMail,
                          height: 20.adaptSize,
                          width: 20.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 56.v),
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_email".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 13.h),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return CustomTextFormField(
              controller: state.passwordEditTextController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 20.adaptSize,
                      width: 20.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              suffix: InkWell(
                  onTap: () {
                    context.read<LoginBloc>().add(ChangePasswordVisibilityEvent(
                        value: !state.isShowPassword));
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.img20,
                          height: 20.adaptSize,
                          width: 20.adaptSize))),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: state.isShowPassword,
              contentPadding: EdgeInsets.symmetric(vertical: 18.v));
        }));
  }

  /// Section Widget
  Widget _buildSignInButton(BuildContext context) {
    return CustomElevatedButton(
        height: 56.v,
        text: "lbl_sign_in".tr,
        margin: EdgeInsets.only(left: 18.h, right: 13.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgMailPrimary,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        buttonStyle: CustomButtonStyles.fillOnPrimary,
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: () {
          onTapSignInButton(context);
        });
  }

  /// Section Widget
  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_google".tr,
        margin: EdgeInsets.only(left: 21.h, right: 16.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLogo, height: 18.v, width: 16.h)),
        onPressed: () {
          onTapSignInWithGoogleButton(context);
        });
  }

  /// Navigates to the uploadScreen when the action is triggered.
  onTapSignInButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.uploadScreen,
    );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapSignInWithGoogleButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
