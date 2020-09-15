import 'package:dartz/dartz.dart';
import 'package:domain_driven/domain/core/failures.dart';
import 'package:domain_driven/domain/core/value_objects.dart';
import 'package:domain_driven/domain/core/value_transformers.dart';
import 'package:domain_driven/domain/core/value_validators.dart';
import 'package:flutter/material.dart';

class NoteBody extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  NoteBody._(this.value);
}

class TodoName extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory TodoName(String input) {
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  TodoName._(this.value);
}

class NoteColor extends ValueObjects<Color> {
  static const List<Color> predefinedColors = [
    Color(0xffff1245),
    Color(0xffff1248),
    Color(0xffff1249),
    Color(0xffff1258),
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  static const maxLength = 1000;

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  NoteColor._(this.value);
}

class List3<T> extends ValueObjects<IList<T>> {
  @override
  final Either<ValueFailure<IList<T>>, IList<T>> value;

  static const maxLength = 3;

  factory List3(IList<T> input) {
    return List3._(
      validateMaxListLength(input, maxLength)
    );
  }

  List3._(this.value);

  int get length {
    return value.getOrElse(() => [] as IList<T>).length();
  }

  bool get isFull {
    return length == maxLength;
  }
}
