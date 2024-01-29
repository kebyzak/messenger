// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DialogEvent {
  String get receiverUid => throw _privateConstructorUsedError;
  String get senderUid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiverUid, String senderUid) loadEvent,
    required TResult Function(
            String receiverUid, String message, String senderUid)
        sendEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiverUid, String senderUid)? loadEvent,
    TResult? Function(String receiverUid, String message, String senderUid)?
        sendEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiverUid, String senderUid)? loadEvent,
    TResult Function(String receiverUid, String message, String senderUid)?
        sendEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) loadEvent,
    required TResult Function(SendEvent value) sendEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? loadEvent,
    TResult? Function(SendEvent value)? sendEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? loadEvent,
    TResult Function(SendEvent value)? sendEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogEventCopyWith<DialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogEventCopyWith<$Res> {
  factory $DialogEventCopyWith(
          DialogEvent value, $Res Function(DialogEvent) then) =
      _$DialogEventCopyWithImpl<$Res, DialogEvent>;
  @useResult
  $Res call({String receiverUid, String senderUid});
}

/// @nodoc
class _$DialogEventCopyWithImpl<$Res, $Val extends DialogEvent>
    implements $DialogEventCopyWith<$Res> {
  _$DialogEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverUid = null,
    Object? senderUid = null,
  }) {
    return _then(_value.copyWith(
      receiverUid: null == receiverUid
          ? _value.receiverUid
          : receiverUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadEventImplCopyWith<$Res>
    implements $DialogEventCopyWith<$Res> {
  factory _$$LoadEventImplCopyWith(
          _$LoadEventImpl value, $Res Function(_$LoadEventImpl) then) =
      __$$LoadEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String receiverUid, String senderUid});
}

/// @nodoc
class __$$LoadEventImplCopyWithImpl<$Res>
    extends _$DialogEventCopyWithImpl<$Res, _$LoadEventImpl>
    implements _$$LoadEventImplCopyWith<$Res> {
  __$$LoadEventImplCopyWithImpl(
      _$LoadEventImpl _value, $Res Function(_$LoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverUid = null,
    Object? senderUid = null,
  }) {
    return _then(_$LoadEventImpl(
      receiverUid: null == receiverUid
          ? _value.receiverUid
          : receiverUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadEventImpl implements LoadEvent {
  const _$LoadEventImpl({required this.receiverUid, required this.senderUid});

  @override
  final String receiverUid;
  @override
  final String senderUid;

  @override
  String toString() {
    return 'DialogEvent.loadEvent(receiverUid: $receiverUid, senderUid: $senderUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventImpl &&
            (identical(other.receiverUid, receiverUid) ||
                other.receiverUid == receiverUid) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiverUid, senderUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventImplCopyWith<_$LoadEventImpl> get copyWith =>
      __$$LoadEventImplCopyWithImpl<_$LoadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiverUid, String senderUid) loadEvent,
    required TResult Function(
            String receiverUid, String message, String senderUid)
        sendEvent,
  }) {
    return loadEvent(receiverUid, senderUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiverUid, String senderUid)? loadEvent,
    TResult? Function(String receiverUid, String message, String senderUid)?
        sendEvent,
  }) {
    return loadEvent?.call(receiverUid, senderUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiverUid, String senderUid)? loadEvent,
    TResult Function(String receiverUid, String message, String senderUid)?
        sendEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(receiverUid, senderUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) loadEvent,
    required TResult Function(SendEvent value) sendEvent,
  }) {
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? loadEvent,
    TResult? Function(SendEvent value)? sendEvent,
  }) {
    return loadEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? loadEvent,
    TResult Function(SendEvent value)? sendEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class LoadEvent implements DialogEvent {
  const factory LoadEvent(
      {required final String receiverUid,
      required final String senderUid}) = _$LoadEventImpl;

  @override
  String get receiverUid;
  @override
  String get senderUid;
  @override
  @JsonKey(ignore: true)
  _$$LoadEventImplCopyWith<_$LoadEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendEventImplCopyWith<$Res>
    implements $DialogEventCopyWith<$Res> {
  factory _$$SendEventImplCopyWith(
          _$SendEventImpl value, $Res Function(_$SendEventImpl) then) =
      __$$SendEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String receiverUid, String message, String senderUid});
}

/// @nodoc
class __$$SendEventImplCopyWithImpl<$Res>
    extends _$DialogEventCopyWithImpl<$Res, _$SendEventImpl>
    implements _$$SendEventImplCopyWith<$Res> {
  __$$SendEventImplCopyWithImpl(
      _$SendEventImpl _value, $Res Function(_$SendEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverUid = null,
    Object? message = null,
    Object? senderUid = null,
  }) {
    return _then(_$SendEventImpl(
      receiverUid: null == receiverUid
          ? _value.receiverUid
          : receiverUid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendEventImpl implements SendEvent {
  const _$SendEventImpl(
      {required this.receiverUid,
      required this.message,
      required this.senderUid});

  @override
  final String receiverUid;
  @override
  final String message;
  @override
  final String senderUid;

  @override
  String toString() {
    return 'DialogEvent.sendEvent(receiverUid: $receiverUid, message: $message, senderUid: $senderUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEventImpl &&
            (identical(other.receiverUid, receiverUid) ||
                other.receiverUid == receiverUid) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiverUid, message, senderUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEventImplCopyWith<_$SendEventImpl> get copyWith =>
      __$$SendEventImplCopyWithImpl<_$SendEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiverUid, String senderUid) loadEvent,
    required TResult Function(
            String receiverUid, String message, String senderUid)
        sendEvent,
  }) {
    return sendEvent(receiverUid, message, senderUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiverUid, String senderUid)? loadEvent,
    TResult? Function(String receiverUid, String message, String senderUid)?
        sendEvent,
  }) {
    return sendEvent?.call(receiverUid, message, senderUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiverUid, String senderUid)? loadEvent,
    TResult Function(String receiverUid, String message, String senderUid)?
        sendEvent,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent(receiverUid, message, senderUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) loadEvent,
    required TResult Function(SendEvent value) sendEvent,
  }) {
    return sendEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? loadEvent,
    TResult? Function(SendEvent value)? sendEvent,
  }) {
    return sendEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? loadEvent,
    TResult Function(SendEvent value)? sendEvent,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent(this);
    }
    return orElse();
  }
}

abstract class SendEvent implements DialogEvent {
  const factory SendEvent(
      {required final String receiverUid,
      required final String message,
      required final String senderUid}) = _$SendEventImpl;

  @override
  String get receiverUid;
  String get message;
  @override
  String get senderUid;
  @override
  @JsonKey(ignore: true)
  _$$SendEventImplCopyWith<_$SendEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DialogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(Stream<List<Message>> messagesStream) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(Stream<List<Message>> messagesStream)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(Stream<List<Message>> messagesStream)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogStateCopyWith<$Res> {
  factory $DialogStateCopyWith(
          DialogState value, $Res Function(DialogState) then) =
      _$DialogStateCopyWithImpl<$Res, DialogState>;
}

/// @nodoc
class _$DialogStateCopyWithImpl<$Res, $Val extends DialogState>
    implements $DialogStateCopyWith<$Res> {
  _$DialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DialogStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DialogState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(Stream<List<Message>> messagesStream) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(Stream<List<Message>> messagesStream)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(Stream<List<Message>> messagesStream)? success,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DialogState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DialogStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DialogState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(Stream<List<Message>> messagesStream) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(Stream<List<Message>> messagesStream)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(Stream<List<Message>> messagesStream)? success,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements DialogState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DialogStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'DialogState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(Stream<List<Message>> messagesStream) success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(Stream<List<Message>> messagesStream)? success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(Stream<List<Message>> messagesStream)? success,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements DialogState {
  const factory Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Stream<List<Message>> messagesStream});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$DialogStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messagesStream = null,
  }) {
    return _then(_$SuccessImpl(
      null == messagesStream
          ? _value.messagesStream
          : messagesStream // ignore: cast_nullable_to_non_nullable
              as Stream<List<Message>>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.messagesStream);

  @override
  final Stream<List<Message>> messagesStream;

  @override
  String toString() {
    return 'DialogState.success(messagesStream: $messagesStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.messagesStream, messagesStream) ||
                other.messagesStream == messagesStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messagesStream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(Stream<List<Message>> messagesStream) success,
  }) {
    return success(messagesStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(Stream<List<Message>> messagesStream)? success,
  }) {
    return success?.call(messagesStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(Stream<List<Message>> messagesStream)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(messagesStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements DialogState {
  const factory Success(final Stream<List<Message>> messagesStream) =
      _$SuccessImpl;

  Stream<List<Message>> get messagesStream;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
