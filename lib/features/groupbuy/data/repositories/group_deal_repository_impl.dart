import 'package:patungan/features/groupbuy/data/datasources/group_deal_remote_data_source.dart';
import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';
import 'package:patungan/features/groupbuy/domain/repositories/group_deal_repository.dart';

class GroupDealRepositoryImpl implements GroupDealRepository {
  final GroupDealRemoteDataSource remote;

  GroupDealRepositoryImpl(this.remote);

  @override
  Stream<List<GroupDealEntity>> getGroupDeals() {
    return remote.getGroupDeals();
  }
}
