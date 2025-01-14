import 'package:ceosi_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/icons.dart';
import '../../../../providers/product_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../../../widgets/text_widget.dart';

// ignore: must_be_immutable
class ProductItemWidget extends ConsumerWidget {
  late String productName;
  late String productCategory;
  late String pointsEquivalent;
  late String imageURL;

  ProductItemWidget(
      {super.key,
      required this.productName,
      required this.productCategory,
      required this.pointsEquivalent,
      required this.imageURL});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('CEOSI-USERS')
        .doc(ref.watch(getUserId.notifier).state)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading'));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          dynamic data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: GestureDetector(
              onTap: data['user_points'] < int.parse(pointsEquivalent)
                  ? null
                  : () async {
                      ref.read(getItemProvider.notifier).state ==
                          ProductModel(
                            productName: productName,
                            productCategory: productCategory,
                            pointsEquivalent: pointsEquivalent,
                            productImage: imageURL,
                          );

                      // Navigator.pushNamed(context, '/rewardviewitemscreen');

                      print(ref
                          .watch(getItemProvider.notifier)
                          .state
                          .productName);
                    },
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: data['user_points'] < int.parse(pointsEquivalent)
                          ? CustomColors.secondary
                          : CustomColors.primary,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.network(
                      imageURL,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoldTextWidget(
                                  color: Colors.black,
                                  fontSize: 16,
                                  text: productName),
                              NormalTextWidget(
                                  color: Colors.black,
                                  fontSize: 12,
                                  text: 'Type: $productCategory'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Image.asset(
                      CustomIcons().coinIcon,
                      height: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BoldTextWidget(
                        color: CustomColors.primary,
                        fontSize: 14,
                        text: '${pointsEquivalent}cc'),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
