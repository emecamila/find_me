part of 'entities.dart';

class DOB {
  final String date;
  final int age;

  const DOB({
    required this.date,
    required this.age,
  });

  DOB copyWith({
    String? date,
    int? age,
  }) =>
      DOB(
        date: date ?? this.date,
        age: age ?? this.age,
      );

  factory DOB.initial() => const DOB(
        date: kEmptyString,
        age: 0,
      );
}
