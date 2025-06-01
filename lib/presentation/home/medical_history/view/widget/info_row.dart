import 'package:flutter/material.dart';

import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const InfoRow({required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
          children: [
            TextSpan(text: "$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value ?? "N/A"),
          ],
        ),
      ),
    );
  }
}
