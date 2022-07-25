import 'package:hive/hive.dart';

part 'detail.g.dart';

@HiveType(typeId: 1)
class Detail {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String content;

  Detail({
    required this.name,
    required this.content,
  });
}
