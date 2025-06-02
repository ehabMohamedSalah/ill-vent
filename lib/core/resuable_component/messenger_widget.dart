import 'package:flutter/material.dart';

class ShowSnackbarExample extends StatelessWidget {
  const ShowSnackbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successful!")),
            );
          },
          child: const Text("Show SnackBar"),
        ),
      ),
    );
  }
}
