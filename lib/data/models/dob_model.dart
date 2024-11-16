part of 'models.dart';

class DOBModel {
  final String date;
  final int age;

  const DOBModel({
    required this.date,
    required this.age,
  });

  DOB toEntity() => DOB(
        date: date,
        age: age,
      );

  factory DOBModel.fromJson(Map<String, dynamic> json) => DOBModel(
        date: json.getString('date'),
        age: json.getInt('age'),
      );
}
