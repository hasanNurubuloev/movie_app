// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StateStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(dynamic value) success,
    required TResult Function(String message) failure,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(dynamic value)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(dynamic value)? success,
    TResult Function(String message)? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
    required TResult Function(LoadingStatus value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
    TResult? Function(LoadingStatus value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    TResult Function(LoadingStatus value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateStatusCopyWith<$Res> {
  factory $StateStatusCopyWith(
          StateStatus value, $Res Function(StateStatus) then) =
      _$StateStatusCopyWithImpl<$Res, StateStatus>;
}

/// @nodoc
class _$StateStatusCopyWithImpl<$Res, $Val extends StateStatus>
    implements $StateStatusCopyWith<$Res> {
  _$StateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStatusImplCopyWith<$Res> {
  factory _$$InitialStatusImplCopyWith(
          _$InitialStatusImpl value, $Res Function(_$InitialStatusImpl) then) =
      __$$InitialStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStatusImplCopyWithImpl<$Res>
    extends _$StateStatusCopyWithImpl<$Res, _$InitialStatusImpl>
    implements _$$InitialStatusImplCopyWith<$Res> {
  __$$InitialStatusImplCopyWithImpl(
      _$InitialStatusImpl _value, $Res Function(_$InitialStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStatusImpl implements InitialStatus {
  const _$InitialStatusImpl();

  @override
  String toString() {
    return 'StateStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(dynamic value) success,
    required TResult Function(String message) failure,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(dynamic value)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(dynamic value)? success,
    TResult Function(String message)? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
    required TResult Function(LoadingStatus value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
    TResult? Function(LoadingStatus value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    TResult Function(LoadingStatus value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialStatus implements StateStatus {
  const factory InitialStatus() = _$InitialStatusImpl;
}

/// @nodoc
abstract class _$$SuccessStatusImplCopyWith<$Res> {
  factory _$$SuccessStatusImplCopyWith(
          _$SuccessStatusImpl value, $Res Function(_$SuccessStatusImpl) then) =
      __$$SuccessStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$SuccessStatusImplCopyWithImpl<$Res>
    extends _$StateStatusCopyWithImpl<$Res, _$SuccessStatusImpl>
    implements _$$SuccessStatusImplCopyWith<$Res> {
  __$$SuccessStatusImplCopyWithImpl(
      _$SuccessStatusImpl _value, $Res Function(_$SuccessStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SuccessStatusImpl(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SuccessStatusImpl implements SuccessStatus {
  const _$SuccessStatusImpl([this.value]);

  @override
  final dynamic value;

  @override
  String toString() {
    return 'StateStatus.success(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStatusImpl &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStatusImplCopyWith<_$SuccessStatusImpl> get copyWith =>
      __$$SuccessStatusImplCopyWithImpl<_$SuccessStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(dynamic value) success,
    required TResult Function(String message) failure,
    required TResult Function() loading,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(dynamic value)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? loading,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(dynamic value)? success,
    TResult Function(String message)? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
    required TResult Function(LoadingStatus value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
    TResult? Function(LoadingStatus value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    TResult Function(LoadingStatus value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessStatus implements StateStatus {
  const factory SuccessStatus([final dynamic value]) = _$SuccessStatusImpl;

  dynamic get value;

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessStatusImplCopyWith<_$SuccessStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureStatusImplCopyWith<$Res> {
  factory _$$FailureStatusImplCopyWith(
          _$FailureStatusImpl value, $Res Function(_$FailureStatusImpl) then) =
      __$$FailureStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureStatusImplCopyWithImpl<$Res>
    extends _$StateStatusCopyWithImpl<$Res, _$FailureStatusImpl>
    implements _$$FailureStatusImplCopyWith<$Res> {
  __$$FailureStatusImplCopyWithImpl(
      _$FailureStatusImpl _value, $Res Function(_$FailureStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureStatusImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureStatusImpl implements FailureStatus {
  const _$FailureStatusImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'StateStatus.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureStatusImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureStatusImplCopyWith<_$FailureStatusImpl> get copyWith =>
      __$$FailureStatusImplCopyWithImpl<_$FailureStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(dynamic value) success,
    required TResult Function(String message) failure,
    required TResult Function() loading,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(dynamic value)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? loading,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(dynamic value)? success,
    TResult Function(String message)? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
    required TResult Function(LoadingStatus value) loading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
    TResult? Function(LoadingStatus value)? loading,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    TResult Function(LoadingStatus value)? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureStatus implements StateStatus {
  const factory FailureStatus({required final String message}) =
      _$FailureStatusImpl;

  String get message;

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureStatusImplCopyWith<_$FailureStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStatusImplCopyWith<$Res> {
  factory _$$LoadingStatusImplCopyWith(
          _$LoadingStatusImpl value, $Res Function(_$LoadingStatusImpl) then) =
      __$$LoadingStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStatusImplCopyWithImpl<$Res>
    extends _$StateStatusCopyWithImpl<$Res, _$LoadingStatusImpl>
    implements _$$LoadingStatusImplCopyWith<$Res> {
  __$$LoadingStatusImplCopyWithImpl(
      _$LoadingStatusImpl _value, $Res Function(_$LoadingStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStatusImpl implements LoadingStatus {
  const _$LoadingStatusImpl();

  @override
  String toString() {
    return 'StateStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(dynamic value) success,
    required TResult Function(String message) failure,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(dynamic value)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(dynamic value)? success,
    TResult Function(String message)? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
    required TResult Function(LoadingStatus value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
    TResult? Function(LoadingStatus value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    TResult Function(LoadingStatus value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingStatus implements StateStatus {
  const factory LoadingStatus() = _$LoadingStatusImpl;
}
