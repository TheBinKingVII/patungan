class GroupDealEntity {
  final String id;
  final String title;
  final String image; // asset path or URL
  final num price;
  final num discount;
  final String? countDown; // legacy string like "01:20:30"
  final double? value; // progress 0..1
  final double? rating;
  final String storeName;
  final Map<String, dynamic>? details;
  final DateTime? endAt;
  final int? targetQuantity;
  final int? currentQuantity;

  // Untuk kompatibilitas dengan widget lama yang masih pakai Map
  final Map<String, dynamic> rawData;

  GroupDealEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
    required this.storeName,
    required this.rawData,
    this.countDown,
    this.value,
    this.rating,
    this.details,
    this.endAt,
    this.targetQuantity,
    this.currentQuantity,
  });
}
