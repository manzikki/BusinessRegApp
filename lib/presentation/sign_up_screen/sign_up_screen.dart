import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:businessregapp/core/app_export.dart';
import 'package:businessregapp/core/utils/validation_functions.dart';
import 'package:businessregapp/widgets/custom_elevated_button.dart';
import 'package:businessregapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(SignUpState(
        signUpModelObj: SignUpModel(),
      ))
        ..add(SignUpInitialEvent()),
      child: SignUpScreen(),
    );
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
            child: Column(
              children: [
                _buildSignUpButton(context),
                SizedBox(height: 23.v),
                _buildFrame(context),
                SizedBox(height: 16.v),
                _buildFirstNameEditText(context),
                SizedBox(height: 16.v),
                _buildLastNameEditText(context),
                SizedBox(height: 16.v),
                _buildPhoneNumberEditText(context),
                SizedBox(height: 16.v),
                _buildEmailEditText(context),
                SizedBox(height: 16.v),
                _buildPasswordEditText(context),
                SizedBox(height: 16.v),
                _buildConfirmPasswordEditText(context),
                SizedBox(height: 23.v),
                _buildSignUpButton2(context),
                SizedBox(height: 11.v),
                Text(
                  "msg_forgot_password".tr,
                  style: CustomTextStyles.bodyLargeOnPrimary_1.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(
        horizontal: 67.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_what_documents_will".tr,
            style: CustomTextStyles.titleMediumBlack900,
          ),
          SizedBox(height: 11.v),
          Text(
            "lbl_thai_id".tr,
            style: CustomTextStyles.bodyMedium14,
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_police_record".tr,
            style: CustomTextStyles.bodyMedium14,
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_vat_id".tr,
            style: CustomTextStyles.bodyMedium14,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstNameEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.firstNameEditTextController,
        builder: (context, firstNameEditTextController) {
          return CustomTextFormField(
            controller: firstNameEditTextController,
            hintText: "lbl_first_name".tr,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.lastNameEditTextController,
        builder: (context, lastNameEditTextController) {
          return CustomTextFormField(
            controller: lastNameEditTextController,
            hintText: "lbl_last_name".tr,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.phoneNumberEditTextController,
        builder: (context, phoneNumberEditTextController) {
          return CustomTextFormField(
            controller: phoneNumberEditTextController,
            hintText: "lbl_phone_number".tr,
            textInputType: TextInputType.phone,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (!isValidPhone(value)) {
                return "err_msg_please_enter_valid_phone_number".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
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
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return CustomTextFormField(
            controller: state.passwordEditTextController,
            hintText: "lbl_password".tr,
            textInputType: TextInputType.visiblePassword,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            suffix: InkWell(
              onTap: () {
                context.read<SignUpBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
                child: CustomImageView(
                  imagePath: ImageConstant.img20,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword,
            contentPadding: EdgeInsets.symmetric(vertical: 18.v),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return CustomTextFormField(
            controller: state.confirmPasswordEditTextController,
            hintText: "msg_confirm_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 18.v, 8.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            suffix: InkWell(
              onTap: () {
                context.read<SignUpBloc>().add(ChangePasswordVisibilityEvent1(
                    value: !state.isShowPassword1));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
                child: CustomImageView(
                  imagePath: ImageConstant.img20,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword1,
            contentPadding: EdgeInsets.symmetric(vertical: 18.v),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpButton2(BuildContext context) {
    return CustomElevatedButton(
      height: 56.v,
      text: "lbl_sign_up2".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgMailPrimary,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillOnPrimary,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }
}
