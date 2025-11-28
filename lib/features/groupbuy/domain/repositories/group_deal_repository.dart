import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';

abstract class GroupDealRepository {
  Stream<List<GroupDealEntity>> getGroupDeals();
}
