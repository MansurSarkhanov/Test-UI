import 'package:another_flushbar/flushbar.dart';
import 'package:burda_ui/Provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Core/Constants/colors.dart';
import '../../Core/Constants/paths.dart';
import '../../Core/Constants/sized_box.dart';
import 'Buttons/sheet_answer_button.dart';

void decisionSheet(context, String title, bool isSmall) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.white,
        height: isSmall ? 180 : 210,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 28),
              ),
              sizedBoxH(20),
              Row(
                children: [
                  SheetAnswerButton(
                    isYes: false,
                    onPress: () {},
                    text: "Legv et",
                  ),
                  sizedBoxW(16),
                  SheetAnswerButton(
                    isYes: true,
                    onPress: () {
                      Navigator.pop(context);
                      print('sdfs0');
                      Flushbar(
                        backgroundColor: const Color(0xFF2B2B2B),
                        margin: const EdgeInsets.all(24),
                        borderRadius: BorderRadius.circular(12),
                        duration: const Duration(seconds: 2),
                        flushbarPosition: FlushbarPosition.BOTTOM,
                        message: 'Bildirişlər bağlanıldı',
                      ).show(context);
                    },
                    text: "Beli, bagla",
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void selectOperationMenu(context, detail) {
  final offset = detail.globalPosition;

  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      600,
      MediaQuery.of(context).size.width - offset.dx,
      MediaQuery.of(context).size.height - offset.dy,
    ),
    items: [
      PopupMenuItem(
        onTap: () async {
          Navigator.of(context).pop();
          decisionSheet(context, "Bu şəxs üçün bildirişləri bağlamaq istədiyinizdən əminsiniz?", false);
        },
        value: 1,
        child: Row(
          children: [
            const Icon(Icons.notifications_off_outlined),
            sizedBoxW(16),
            const Text('Bildirişləri bağla'),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: () async {
          Navigator.of(context).pop();
          decisionSheet(context, "Bu şəxsi bloklamaq istədiyinizdən əminsiniz?", true);
        },
        value: 2,
        child: Row(
          children: [
            const Icon(Icons.person_2_outlined),
            sizedBoxW(16),
            const Text('Blokla'),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: () {
          Navigator.of(context).pop();
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                  child: Column(
                    children: [
                      const SheetHeader(),
                      sizedBoxH(16),
                      const Row(
                        children: [
                          Text(
                            "Səbəb seçin",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxH(12),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: context.watch<HomeProvider>().complaintList.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CupertinoCheckbox(
                                      activeColor: AppColors.orangeColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      value: context.watch<HomeProvider>().complaintList[index].isSelected,
                                      onChanged: (value) {
                                        context.read<HomeProvider>().selectComplaint(value, index);
                                      }),
                                  Expanded(
                                    child: Text(
                                      context.watch<HomeProvider>().complaintList[index].title,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 320,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const SheetHeader(),
                                        Image.asset(
                                          IconPath.success,
                                          width: 100,
                                          height: 100,
                                        ),
                                        sizedBoxH(16),
                                        const Text(
                                          'Şikayətin göndərildi',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        sizedBoxH(24),
                                        SheetAnswerButton(text: "Bağla", onPress: () {}, isYes: false)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orangeColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Göndər",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ))),
                      sizedBoxH(16)
                    ],
                  ),
                ),
              );
            },
          );
        },
        value: 3,
        child: Row(
          children: [
            const Icon(
              Icons.flag_rounded,
              color: AppColors.orangeColor,
            ),
            sizedBoxW(16),
            const Text(
              'Şikayət et',
              style: TextStyle(color: AppColors.orangeColor),
            ),
          ],
        ),
      ),
    ],
    elevation: 8.0,
  );
}






class SheetHeader extends StatelessWidget {
  const SheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              "Şikayət et",
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
      ],
    );
  }
}
