import 'package:flutter/material.dart';

import '../../../../../../../../../../../Domain/entity/dr_entity.dart';
import '../../../../../../../../../../../core/resuable_component/LoginCustomFormField.dart';


class BookingMobileLayout extends StatefulWidget {
  final DrEntity deal;

  BookingMobileLayout({required this.deal});

  @override
  State<BookingMobileLayout> createState() => _BookingMobileLayoutState();
}

class _BookingMobileLayoutState extends State<BookingMobileLayout> {

  late TextEditingController nameController  ;
  late TextEditingController phoneController  ;
  late TextEditingController locationController  ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    phoneController=TextEditingController();
    locationController=TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
    nameController.dispose();
    locationController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

        appBar: AppBar(title: Text("Booking Appointment")),
         body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.deal.thumbnail ?? "",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.deal.name ?? "Doctor's Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Specialization: ${widget.deal.description ?? "General Medicine"}",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),
            TextField(
               controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
             TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Text(widget.deal.location ?? ""),
             SizedBox(height: 60), // Replacing Spacer with SizedBox
            ElevatedButton(
              onPressed: () {
                // Handle booking logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Booking Confirmed"),
                    content: Text("You have successfully booked an appointment!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);

                        },
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                  width: double.infinity,
                  child: Center(child: Text("Confirm Booking"))),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.teal,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
