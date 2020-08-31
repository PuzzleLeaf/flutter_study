import 'package:dartz/dartz.dart';
import 'package:domain_driven/domain/core/errors.dart';
import 'package:domain_driven/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

abstract class ValueObjects<T> {
  ValueObjects();
  Either<ValueFailure<T>, T> value;

  /// [ValueFailure]을 포함한 [UnexpectedValueError] 에러를 발생
  T getOrCrash() {
    // dartz에 현재 값을 그대로 반환하는 id가 존재
    // identity = id - some as writing (right) => right
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'ValueObject($value)';

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is ValueObjects<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class UniqueId extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  UniqueId._(this.value);
}