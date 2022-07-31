import 'package:doxbox/models/detail.dart';
import 'package:hive/hive.dart';

part 'document.g.dart';

@HiveType(typeId: 0)
class Document {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final Detail primaryDetail;

  @HiveField(3)
  final List<Detail> details;

  @HiveField(4)
  final bool isFavorite;

  Document({
    required this.id,
    required this.title,
    required this.primaryDetail,
    required this.details,
    required this.isFavorite,
  });
}
