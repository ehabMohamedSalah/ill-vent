import 'package:flutter/material.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../booking/booking_form_screen.dart';


class DealDetailsMobileLayout extends StatelessWidget {
  final DrEntity deal;

  DealDetailsMobileLayout({required this.deal});

  void _handleBooking(BuildContext context) {
    // Navigate to Booking form
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingScreen(deal: deal),
      ),
    );*/

    Navigator.pushReplacement(
        context, MaterialPageRoute(
      builder: (context) => BookingScreen(deal: deal),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deal.name ?? "Deal Details",style: Appstyle.medium25(context),),
        centerTitle: true,
        backgroundColor: Colors.teal, // Added a color to the app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                deal.thumbnail ?? "",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              deal.name ?? "Doctor's Name", // Doctor's name as the title
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Title color
              ),
            ),
            SizedBox(height: 8),
            Text(
              deal.description ?? "No Description Available",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700]),
                SizedBox(width: 4),
                Text(
                  "4.5", // Sample rating (can be dynamic)
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Price: \$${deal.deals?.dealPrice??deal.price}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Specialization: ${deal.description ?? "General Medicine"}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              "Valid Until: ${deal.deals?.validUntil??"---"}",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _handleBooking(context),
              icon: Icon(Icons.calendar_today),
              label: Text("Book Appointment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

