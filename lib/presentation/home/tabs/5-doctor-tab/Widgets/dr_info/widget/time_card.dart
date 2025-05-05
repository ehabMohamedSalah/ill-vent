import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class TimeItem extends StatelessWidget {
  final String formattedDate;
  final bool? isSelected;

  const TimeItem(this.formattedDate, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool selected = isSelected ?? false;

    return Container(
      width: 80.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: selected ? Colors.white : ColorManager.secondaryColor,
        border: Border.all(
          color: selected ? Colors.red : const Color(0xff71D1E2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        formattedDate,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
