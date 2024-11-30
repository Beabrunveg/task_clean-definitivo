import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_data.freezed.dart';
part 'coupon_data.g.dart';

/// CouponData is a widget that shows the coupon data.
/// Model class for the coupon data.
@freezed
class CouponData with _$CouponData {
  const factory CouponData({
    int? id,
    String? cod,
    String? date,
    String? discount,
    String? title,
    String? description,
  }) = _CouponData;

  factory CouponData.fromJson(Map<String, dynamic> json) =>
      _$CouponDataFromJson(json);
}
