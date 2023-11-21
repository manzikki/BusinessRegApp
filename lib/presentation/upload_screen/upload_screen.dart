import 'bloc/upload_bloc.dart';
import 'models/upload_model.dart';
import 'package:businessregapp/core/app_export.dart';
import 'package:businessregapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<UploadBloc>(
      create: (context) => UploadBloc(UploadState(
        uploadModelObj: UploadModel(),
      ))
        ..add(UploadInitialEvent()),
      child: UploadScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<UploadBloc, UploadState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  CustomElevatedButton(
                    text: "lbl_my_merchants".tr,
                  ),
                  Spacer(
                    flex: 38,
                  ),
                  Container(
                    decoration: AppDecoration.outlineBlack,
                    child: Text(
                      "lbl_upload".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Text(
                    "lbl_upload".tr,
                    style: CustomTextStyles.bodyLargeOnPrimary_1,
                  ),
                  Spacer(
                    flex: 61,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
