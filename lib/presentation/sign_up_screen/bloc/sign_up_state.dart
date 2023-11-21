// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.
class SignUpState extends Equatable {
  SignUpState({
    this.firstNameEditTextController,
    this.lastNameEditTextController,
    this.phoneNumberEditTextController,
    this.emailEditTextController,
    this.passwordEditTextController,
    this.confirmPasswordEditTextController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.signUpModelObj,
  });

  TextEditingController? firstNameEditTextController;

  TextEditingController? lastNameEditTextController;

  TextEditingController? phoneNumberEditTextController;

  TextEditingController? emailEditTextController;

  TextEditingController? passwordEditTextController;

  TextEditingController? confirmPasswordEditTextController;

  SignUpModel? signUpModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        firstNameEditTextController,
        lastNameEditTextController,
        phoneNumberEditTextController,
        emailEditTextController,
        passwordEditTextController,
        confirmPasswordEditTextController,
        isShowPassword,
        isShowPassword1,
        signUpModelObj,
      ];
  SignUpState copyWith({
    TextEditingController? firstNameEditTextController,
    TextEditingController? lastNameEditTextController,
    TextEditingController? phoneNumberEditTextController,
    TextEditingController? emailEditTextController,
    TextEditingController? passwordEditTextController,
    TextEditingController? confirmPasswordEditTextController,
    bool? isShowPassword,
    bool? isShowPassword1,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      firstNameEditTextController:
          firstNameEditTextController ?? this.firstNameEditTextController,
      lastNameEditTextController:
          lastNameEditTextController ?? this.lastNameEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      emailEditTextController:
          emailEditTextController ?? this.emailEditTextController,
      passwordEditTextController:
          passwordEditTextController ?? this.passwordEditTextController,
      confirmPasswordEditTextController: confirmPasswordEditTextController ??
          this.confirmPasswordEditTextController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
