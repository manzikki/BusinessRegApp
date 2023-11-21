import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:businessregapp/presentation/upload_screen/models/upload_model.dart';
part 'upload_event.dart';
part 'upload_state.dart';

/// A bloc that manages the state of a Upload according to the event that is dispatched to it.
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc(UploadState initialState) : super(initialState) {
    on<UploadInitialEvent>(_onInitialize);
  }

  _onInitialize(
    UploadInitialEvent event,
    Emitter<UploadState> emit,
  ) async {}
}
