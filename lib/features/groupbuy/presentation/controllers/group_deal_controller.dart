import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:patungan/features/groupbuy/data/datasources/group_deal_remote_data_source.dart';
import 'package:patungan/features/groupbuy/data/repositories/group_deal_repository_impl.dart';
import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';
import 'package:patungan/features/groupbuy/domain/repositories/group_deal_repository.dart';
import 'package:patungan/features/groupbuy/domain/usecases/get_group_deals.dart';

class GroupDealController extends GetxController {
  late final GroupDealRepository _repository;
  late final GetGroupDeals _getGroupDeals;

  GroupDealController({GroupDealRepository? repository}) {
    _repository =
        repository ??
        GroupDealRepositoryImpl(
          GroupDealRemoteDataSourceImpl(FirebaseFirestore.instance),
        );
    _getGroupDeals = GetGroupDeals(_repository);
  }

  Stream<List<GroupDealEntity>> get groupDealsStream => _getGroupDeals();
}
