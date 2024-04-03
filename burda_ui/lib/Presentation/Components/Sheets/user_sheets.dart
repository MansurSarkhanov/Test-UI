import 'package:burda_ui/Core/Constants/query.dart';
import 'package:burda_ui/Presentation/Animation/bounce_animation.dart';
import 'package:burda_ui/Presentation/Components/selection_menu.dart';
import 'package:burda_ui/Provider/home_provider.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constants/colors.dart';
import '../../../Core/Constants/sized_box.dart';

void showSheet(context, HomeProvider provider, int index) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: mediaQuery(context, height: 0.62),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16, bottom: 16),
          child: BounceFromBottomAnimation(
            delay: 2,
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(8)),
                ),
                sizedBoxH(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF7F7F7)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.close),
                            )))
                  ],
                ),
                Expanded(
                  child: BounceFromBottomAnimation(
                    delay: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.contain, image: NetworkImage(provider.users[index].imageUrl))),
                    ),
                  ),
                ),
                sizedBoxH(8),
                BounceFromBottomAnimation(
                  delay: 3,
                  child: Text(
                    provider.users[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                sizedBoxH(4),
                BounceFromBottomAnimation(
                  delay: 3,
                  child: Text(
                    provider.users[index].pleace,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
                  ),
                ),
                BounceFromBottomAnimation(
                  delay: 3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFFDEAE8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          sizedBoxW(4),
                          Text(provider.users[index].favorites.toString())
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),
                sizedBoxH(12),
                BounceFromBottomAnimation(
                  delay: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      sizedBoxH(8),
                      const Text(
                        "Cat-lover, Designer, Weekend fan and biologist",
                        style: TextStyle(fontSize: 18, color: Color(0xFF5E5E5E)),
                      ),
                      sizedBoxH(24),
                      BounceFromBottomAnimation(
                        delay: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.orangeColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                  child: const Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      "Send Message",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ))),
                            ),
                            sizedBoxW(12),
                            GestureDetector(
                              onTapDown: (detail) {
                                selectOperationMenu(context, detail);
                              },
                              child: Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Icon(Icons.more_horiz_outlined),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
