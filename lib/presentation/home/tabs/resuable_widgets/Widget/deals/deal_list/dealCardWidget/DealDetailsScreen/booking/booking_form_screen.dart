import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/size_config.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/layouts/pharmacy_desktop_layout.dart';
import 'package:ill_vent/presentation/home/tabs/resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/booking/layouts/booking_desktop_layout.dart';
import 'package:ill_vent/presentation/home/tabs/resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/booking/layouts/booking_tablet_layout.dart';
import 'package:ill_vent/presentation/home/tabs/resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/layouts/DealDetails_mobile_layout.dart';
import 'package:ill_vent/presentation/home/tabs/resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/layouts/DealDetails_tablet_layout.dart';
import '../../../../../../../../../../Domain/entity/dr_entity.dart';
import '../../../../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import 'layouts/booking_mobilelayout.dart';




class BookingScreen extends StatelessWidget {
  final DrEntity deal;
  BookingScreen({super.key,required this.deal});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   Colors.white,
      body: AdaptiveLayout(
        mobileLayout: (context) =>   BookingMobileLayout(deal: deal),
        tabletLayout: (context) => const BookingTabletLayout() ,
        desktopLayout: (context) => const BookingDesktopLayout(),
      ),
    );
  }
}
