import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class VerItemWidget extends StatefulWidget {
  final dynamic model;
  const VerItemWidget({super.key, required this.model});

  @override
  State<VerItemWidget> createState() => _VerItemWidgetState();
}

class _VerItemWidgetState extends State<VerItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Container(

      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    widget.model.thumbnail ?? "",
                    fit: BoxFit.fill,
                    height: 70,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.model.name ?? "",
                          style: Appstyle.small15(context)
                              .copyWith(color: Colors.black, fontSize: 20),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.model.rating ?? ""}",
                            style: Appstyle.small15(context)
                                .copyWith(color: Colors.black26),
                          ),
                          Icon(Icons.star, color: Colors.yellow, size: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.model.description ?? "",
                    style: Appstyle.small15(context).copyWith(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.model.location ?? "",
                    style: Appstyle.small15(context)
                        .copyWith(color: Color(0xff5774BA)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset("assets/images/5_hospitalScreen/healthicons_insurance-card.png"),
                SizedBox(width: 5),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.model.contactNumber ?? "",
                      style: Appstyle.small15(context)
                          .copyWith(color: Color(0xff5774BA)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                final url = "https://www.mohp.gov.eg"; // موقع وزارة الصحة المصرية
                final uri = Uri.parse(url);
                debugPrint("View More tapped");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint("Could not launch $url");
                }
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 36,
                  width: 108,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "View More",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
