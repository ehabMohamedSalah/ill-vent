import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerWidget extends StatelessWidget {
  final MobileScannerController controller;
  final void Function(BarcodeCapture) onDetect;

  const QRScannerWidget({
    required this.controller,
    required this.onDetect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          child: MobileScanner(
            controller: controller,
            onDetect: onDetect,
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: ScannerOverlay(),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: IconButton(
            icon: Icon(
              controller.torchEnabled ? Icons.flash_off : Icons.flash_on,
              color: Colors.white,
            ),
            onPressed: () {
              controller.toggleTorch();
            },
          ),
        ),
      ],
    );
  }
}

class ScannerOverlay extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    final centerWidth = size.width * 0.8;
    final centerHeight = size.height * 0.4;
    final centerX = (size.width - centerWidth) / 2;
    final centerY = (size.height - centerHeight) / 2;

    final centerRect = Rect.fromLTWH(centerX, centerY, centerWidth, centerHeight);
    final clearPaint = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.clear;

    canvas.drawRect(centerRect, clearPaint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(centerRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
