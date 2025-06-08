import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class TimeItem extends StatelessWidget {
  final String formattedDate;
  final bool? isSelected;
  final bool? isReserved;

  const TimeItem(this.formattedDate, this.isSelected, this.isReserved,{super.key});

  @override
  Widget build(BuildContext context) {
    final bool selected = isSelected ?? false;

    return  isReserved==false?Container(
      width: 80.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: isReserved==true?BoxDecoration(
        color: selected ? Colors.red : ColorManager.secondaryColor,
        border: Border.all(
          color: selected ? Colors.red : const Color(0xff71D1E2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ):BoxDecoration(
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
    ):
    Column(
      children: [
        Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: isReserved==true?BoxDecoration(
            color: selected ? Colors.red : ColorManager.secondaryColor,
            border: Border.all(
              color: selected ? Colors.red : const Color(0xff71D1E2),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ):BoxDecoration(
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
        ),
        Text("isReserved",style: Appstyle.small15(context).copyWith(color: Colors.black),),
      ],
    );
  }
}
