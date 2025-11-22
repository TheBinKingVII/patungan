import 'package:flutter/material.dart';
import 'package:patungan/features/detail_product/presentation/widgets/rating.dart';

class Reviews extends StatelessWidget {
  final List<Map<String, dynamic>> reviewsData;

  const Reviews({super.key, required this.reviewsData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviewsData.length,
      itemBuilder: (context, index) {
        final review = reviewsData[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey.shade200),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        review['avatar'] ?? 'https://via.placeholder.com/150',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      review['user'] ?? "Tanpa Nama",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Text(
                  review['date'] ?? " ",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              review['comment'] ?? "",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w300,
              ),
            ),

            SizedBox(height: 10),
            Rating(ratingValue: review['value'], size: 12, fontSize: 12,),
            SizedBox(height: 10),
          ],
        );
        // return ListTile(
        //   leading: CircleAvatar(
        //     backgroundImage: NetworkImage(review['avatar'] ?? 'https://via.placeholder.com/150'),
        //   ),
        //   title: Text(
        //     review['user'] ?? "Tanpa Nama",
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        //   subtitle: Text(review['comment'] ?? ""),
        //   trailing: Text(review['date'] ?? ""),
        // );
      },
    );
  }
}
