import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory.freezed.dart';
part 'inventory.g.dart';

/// Inventory is a widget that shows the inventory.
/// Model class for the inventory.
@freezed
class Inventory with _$Inventory {
  const factory Inventory({
    required int id,
    required String name,
    required String image,
  }) = _Inventory;

  factory Inventory.fromJson(Map<String, dynamic> json) =>
      _$InventoryFromJson(json);
}
