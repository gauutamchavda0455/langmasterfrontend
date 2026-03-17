/// Parameter class used when a [UseCase] does not require any input.
///
/// ```dart
/// class GetCurrentUser extends UseCase<User, NoParams> {
///   @override
///   Future<Result<User>> call(NoParams params) { ... }
/// }
///
/// // Invocation:
/// final result = await getCurrentUser(NoParams());
/// ```
class NoParams {
  const NoParams();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NoParams;

  @override
  int get hashCode => 0;

  @override
  String toString() => 'NoParams()';
}
