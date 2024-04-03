import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../Core/Constants/colors.dart';
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
