import 'package:dartz/dartz.dart';
import 'package:domain_driven/domain/core/failures.dart';
import 'package:flutter/foundation.dart';


@immutable
abstract class ValueObjects<T> {
  ValueObjects();
  Either<ValueFailure<T>, T> value;

  bool isValid() => value.isRight();

  @override
  String toString() => 'EmailAddress($value)';

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is ValueObjects<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}