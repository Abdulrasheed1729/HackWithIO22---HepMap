import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Doctor extends Equatable {
  final String name;
  final String imageUrl;
  final String? _areaOfSpecialization;
  final double? _rating;
  final String? _details;

  const Doctor({
    required this.name,
    required this.imageUrl,
    String? areaOfSpecialization,
    double? rating,
    String? details,
  })  : _rating = rating ?? 0.0,
        _details = details ?? '',
        _areaOfSpecialization = areaOfSpecialization ?? '';

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        _areaOfSpecialization,
        _rating,
        _details,
      ];

  static List<Doctor> demoDoctors = [
    const Doctor(
      name: 'Femi Marc',
      imageUrl: 'assets/images/Dr-Femi-Marc.jpg',
    ),
    const Doctor(
      name: 'Kim Park',
      imageUrl: 'assets/images/Dr-Kim-Park.jpg',
    ),
    const Doctor(
      name: 'Max Will',
      imageUrl: 'assets/images/Dr-Max-Wiill.jpg',
    ),
    const Doctor(
      name: 'Lisa Job',
      imageUrl: 'assets/images/Dr-Lisa-Job.jpg',
    ),
    const Doctor(
      name: 'Fred Walt',
      imageUrl: 'assets/images/Dr-Fred-Walt.jpg',
    ),
    const Doctor(
      name: 'Hamdalah Lu',
      imageUrl: 'assets/images/Dr-Hamdalah-Lu.jpg',
    ),
    const Doctor(
      name: 'Fawzan Ali',
      imageUrl: 'assets/images/Dr-Fawzan-Ali.jpg',
    ),
    const Doctor(
      name: 'Anna Bob',
      imageUrl: 'assets/images/Dr-Anna-Bob.jpg',
    ),
  ];
}
