// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_workout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditWorkoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Workout workout) loaded,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Workout workout)? loaded,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Workout workout)? loaded,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditWorkoutLoaded value) loaded,
    required TResult Function(EditWorkoutLoading value) loading,
    required TResult Function(EditWorkoutError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditWorkoutLoaded value)? loaded,
    TResult? Function(EditWorkoutLoading value)? loading,
    TResult? Function(EditWorkoutError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditWorkoutLoaded value)? loaded,
    TResult Function(EditWorkoutLoading value)? loading,
    TResult Function(EditWorkoutError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditWorkoutStateCopyWith<$Res> {
  factory $EditWorkoutStateCopyWith(
          EditWorkoutState value, $Res Function(EditWorkoutState) then) =
      _$EditWorkoutStateCopyWithImpl<$Res, EditWorkoutState>;
}

/// @nodoc
class _$EditWorkoutStateCopyWithImpl<$Res, $Val extends EditWorkoutState>
    implements $EditWorkoutStateCopyWith<$Res> {
  _$EditWorkoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditWorkoutLoadedImplCopyWith<$Res> {
  factory _$$EditWorkoutLoadedImplCopyWith(_$EditWorkoutLoadedImpl value,
          $Res Function(_$EditWorkoutLoadedImpl) then) =
      __$$EditWorkoutLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Workout workout});
}

/// @nodoc
class __$$EditWorkoutLoadedImplCopyWithImpl<$Res>
    extends _$EditWorkoutStateCopyWithImpl<$Res, _$EditWorkoutLoadedImpl>
    implements _$$EditWorkoutLoadedImplCopyWith<$Res> {
  __$$EditWorkoutLoadedImplCopyWithImpl(_$EditWorkoutLoadedImpl _value,
      $Res Function(_$EditWorkoutLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_$EditWorkoutLoadedImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }
}

/// @nodoc

class _$EditWorkoutLoadedImpl implements EditWorkoutLoaded {
  const _$EditWorkoutLoadedImpl({required this.workout});

  @override
  final Workout workout;

  @override
  String toString() {
    return 'EditWorkoutState.loaded(workout: $workout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditWorkoutLoadedImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditWorkoutLoadedImplCopyWith<_$EditWorkoutLoadedImpl> get copyWith =>
      __$$EditWorkoutLoadedImplCopyWithImpl<_$EditWorkoutLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Workout workout) loaded,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loaded(workout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Workout workout)? loaded,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loaded?.call(workout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Workout workout)? loaded,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(workout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditWorkoutLoaded value) loaded,
    required TResult Function(EditWorkoutLoading value) loading,
    required TResult Function(EditWorkoutError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditWorkoutLoaded value)? loaded,
    TResult? Function(EditWorkoutLoading value)? loading,
    TResult? Function(EditWorkoutError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditWorkoutLoaded value)? loaded,
    TResult Function(EditWorkoutLoading value)? loading,
    TResult Function(EditWorkoutError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EditWorkoutLoaded implements EditWorkoutState {
  const factory EditWorkoutLoaded({required final Workout workout}) =
      _$EditWorkoutLoadedImpl;

  Workout get workout;
  @JsonKey(ignore: true)
  _$$EditWorkoutLoadedImplCopyWith<_$EditWorkoutLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditWorkoutLoadingImplCopyWith<$Res> {
  factory _$$EditWorkoutLoadingImplCopyWith(_$EditWorkoutLoadingImpl value,
          $Res Function(_$EditWorkoutLoadingImpl) then) =
      __$$EditWorkoutLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditWorkoutLoadingImplCopyWithImpl<$Res>
    extends _$EditWorkoutStateCopyWithImpl<$Res, _$EditWorkoutLoadingImpl>
    implements _$$EditWorkoutLoadingImplCopyWith<$Res> {
  __$$EditWorkoutLoadingImplCopyWithImpl(_$EditWorkoutLoadingImpl _value,
      $Res Function(_$EditWorkoutLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditWorkoutLoadingImpl implements EditWorkoutLoading {
  const _$EditWorkoutLoadingImpl();

  @override
  String toString() {
    return 'EditWorkoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditWorkoutLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Workout workout) loaded,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Workout workout)? loaded,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Workout workout)? loaded,
    TResult Function()? loading,
    TResult Function()? error,
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
    required TResult Function(EditWorkoutLoaded value) loaded,
    required TResult Function(EditWorkoutLoading value) loading,
    required TResult Function(EditWorkoutError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditWorkoutLoaded value)? loaded,
    TResult? Function(EditWorkoutLoading value)? loading,
    TResult? Function(EditWorkoutError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditWorkoutLoaded value)? loaded,
    TResult Function(EditWorkoutLoading value)? loading,
    TResult Function(EditWorkoutError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditWorkoutLoading implements EditWorkoutState {
  const factory EditWorkoutLoading() = _$EditWorkoutLoadingImpl;
}

/// @nodoc
abstract class _$$EditWorkoutErrorImplCopyWith<$Res> {
  factory _$$EditWorkoutErrorImplCopyWith(_$EditWorkoutErrorImpl value,
          $Res Function(_$EditWorkoutErrorImpl) then) =
      __$$EditWorkoutErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditWorkoutErrorImplCopyWithImpl<$Res>
    extends _$EditWorkoutStateCopyWithImpl<$Res, _$EditWorkoutErrorImpl>
    implements _$$EditWorkoutErrorImplCopyWith<$Res> {
  __$$EditWorkoutErrorImplCopyWithImpl(_$EditWorkoutErrorImpl _value,
      $Res Function(_$EditWorkoutErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditWorkoutErrorImpl implements EditWorkoutError {
  const _$EditWorkoutErrorImpl();

  @override
  String toString() {
    return 'EditWorkoutState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditWorkoutErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Workout workout) loaded,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Workout workout)? loaded,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Workout workout)? loaded,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditWorkoutLoaded value) loaded,
    required TResult Function(EditWorkoutLoading value) loading,
    required TResult Function(EditWorkoutError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditWorkoutLoaded value)? loaded,
    TResult? Function(EditWorkoutLoading value)? loading,
    TResult? Function(EditWorkoutError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditWorkoutLoaded value)? loaded,
    TResult Function(EditWorkoutLoading value)? loading,
    TResult Function(EditWorkoutError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EditWorkoutError implements EditWorkoutState {
  const factory EditWorkoutError() = _$EditWorkoutErrorImpl;
}
