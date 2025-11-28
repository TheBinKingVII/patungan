import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';

class GroupDealModel extends GroupDealEntity {
  GroupDealModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.discount,
    required super.storeName,
    required super.rawData,
    super.countDown,
    super.value,
    super.rating,
    super.details,
    super.endAt,
    super.targetQuantity,
    super.currentQuantity,
  });

  factory GroupDealModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};

    return GroupDealModel(
      id: doc.id,
      title: data['title'] ?? '',
      image: data['imageUrl'] ?? data['image'] ?? '',
      price: data['price'] ?? 0,
      discount: data['discount'] ?? 0,
      storeName: data['toko'] ?? data['storeName'] ?? '',
      // Jika count_down disimpan sebagai Timestamp di Firestore,
      // gunakan sebagai sumber endAt, bukan string countdown.
      countDown: data['count_down'] is String ? data['count_down'] : null,
      value: (data['value'] as num?)?.toDouble(),
      rating: (data['rating'] as num?)?.toDouble(),
      details: data['details'] as Map<String, dynamic>?,
      endAt: (data['count_down'] is Timestamp)
          ? (data['count_down'] as Timestamp).toDate()
          : (data['endAt'] is Timestamp)
          ? (data['endAt'] as Timestamp).toDate()
          : null,
      targetQuantity:
          (data['maxParticipant'] ??
                  data['targetQuantity'] ??
                  data['targetSlot'])
              as int?,
      currentQuantity:
          (data['currentParticipant'] ??
                  data['currentQuantity'] ??
                  data['currentSlot'])
              as int?,
      rawData: data,
    );
  }
}
