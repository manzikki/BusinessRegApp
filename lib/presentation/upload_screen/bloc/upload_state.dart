// ignore_for_file: must_be_immutable

part of 'upload_bloc.dart';

/// Represents the state of Upload in the application.
class UploadState extends Equatable {
  UploadState({this.uploadModelObj});

  UploadModel? uploadModelObj;

  @override
  List<Object?> get props => [
        uploadModelObj,
      ];
  UploadState copyWith({UploadModel? uploadModelObj}) {
    return UploadState(
      uploadModelObj: uploadModelObj ?? this.uploadModelObj,
    );
  }
}
