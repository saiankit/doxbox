import 'package:doxbox/models/detail.dart';
import 'package:hive/hive.dart';

part 'document.g.dart';

@HiveType(typeId: 0)
class Document {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final Detail primaryDetail;

  @HiveField(2)
  final List<Detail> details;

  Document({
    required this.title,
    required this.primaryDetail,
    required this.details,
  });
}
