import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_status.freezed.dart';

@freezed
class StateStatus with _$StateStatus {
  const factory StateStatus.initial() = InitialStatus;
  const factory StateStatus.success([dynamic value]) = SuccessStatus;
  const factory StateStatus.failure({required String message}) = FailureStatus;
  const factory StateStatus.loading() = LoadingStatus;
}