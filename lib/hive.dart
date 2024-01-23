// todo_model.dart
import 'package:hive/hive.dart';

part 'hive.g.dart';

@HiveType(typeId: 0)
   class Tourist {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String touristName;

  @HiveField(2)
  final String touristEmail;

  @HiveField(3)
  final String touristLocation;

  @HiveField(4)
  final String createdAt;

  Tourist({
    required this.id,
    required this.touristName,
    required this.touristEmail,
    required this.touristLocation,
    required this.createdAt,
  });
}