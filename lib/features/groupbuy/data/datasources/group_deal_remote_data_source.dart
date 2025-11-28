import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungan/features/groupbuy/data/models/group_deal_model.dart';

abstract class GroupDealRemoteDataSource {
  Stream<List<GroupDealModel>> getGroupDeals();
}

class GroupDealRemoteDataSourceImpl implements GroupDealRemoteDataSource {
  final FirebaseFirestore firestore;

  GroupDealRemoteDataSourceImpl(this.firestore);

  @override
  Stream<List<GroupDealModel>> getGroupDeals() {
    return firestore
        .collection('groupDeals')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => GroupDealModel.fromFirestore(doc))
              .toList(),
        );
  }
}
