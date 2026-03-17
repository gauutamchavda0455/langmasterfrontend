// TODO: Add `dartz` (or `fpdart`) to pubspec.yaml dependencies.
// dependencies:
//   dartz: ^0.10.1

import 'package:app/core/error/failures.dart';

/// Base class for all use cases in the domain layer.
///
/// A use case encapsulates a single piece of business logic and returns
/// an [Either]-style result: a [Failure] on the left or a success value
/// of type [Type] on the right.
///
/// ```dart
/// class GetUser extends UseCase<User, GetUserParams> {
///   GetUser(this.repository);
///   final UserRepository repository;
///
///   @override
///   Future<Either<Failure, User>> call(GetUserParams params) {
///     return repository.getUser(params.id);
///   }
/// }
/// ```
///
/// TODO: Replace the return type with `Future<Either<Failure, Type>>` from
/// the `dartz` package once the dependency is added.
abstract class UseCase<Type, Params> {
  /// Executes the use case.
  ///
  /// Returns a [Future] that resolves to either a [Failure] or a [Type].
  ///
  /// TODO: Change return type to `Future<Either<Failure, Type>>` once
  /// dartz is added. The current signature uses a plain Future as a
  /// placeholder.
  Future<Result<Type>> call(Params params);
}

/// A lightweight result wrapper used until `dartz` [Either] is available.
///
/// TODO: Remove this class and use `Either<Failure, T>` from dartz instead.
class Result<T> {
  Result._({this.data, this.failure});

  /// Creates a successful result containing [data].
  factory Result.success(T data) => Result._(data: data);

  /// Creates a failed result containing a [Failure].
  factory Result.failure(Failure failure) => Result._(failure: failure);

  /// The success value, if any.
  final T? data;

  /// The failure, if any.
  final Failure? failure;

  /// `true` when the result is successful.
  bool get isSuccess => failure == null;

  /// `true` when the result represents a failure.
  bool get isFailure => failure != null;

  /// Folds the result into a single value.
  R fold<R>(R Function(Failure) onFailure, R Function(T) onSuccess) {
    if (isFailure) return onFailure(failure!);
    return onSuccess(data as T);
  }
}
