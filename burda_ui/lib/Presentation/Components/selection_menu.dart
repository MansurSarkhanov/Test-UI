import 'package:flutter/material.dart';

import '../../Core/Constants/colors.dart';
import '../../Core/Constants/sized_box.dart';
import 'Buttons/sheet_answer_button.dart';

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
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                height: 210,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Bu şəxs üçün bildirişləri bağlamaq istədiyinizdən əminsiniz?',
                        style: TextStyle(fontSize: 28),
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
                            onPress: () {},
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
        onTap: () {
          Navigator.of(context).pop();
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
