// ignore_for_file: must_be_immutable

part of 'upload_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Upload widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class UploadEvent extends Equatable {}

/// Event that is dispatched when the Upload widget is first created.
class UploadInitialEvent extends UploadEvent {
  @override
  List<Object?> get props => [];
}
