import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';
import 'package:patungan/features/groupbuy/domain/repositories/group_deal_repository.dart';

class GetGroupDeals {
  final GroupDealRepository repository;

  GetGroupDeals(this.repository);

  Stream<List<GroupDealEntity>> call() {
    return repository.getGroupDeals();
  }
}
