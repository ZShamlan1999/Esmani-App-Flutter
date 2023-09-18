// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRcodeScanner extends StatefulWidget {
//   const QRcodeScanner({super.key});
//
//   @override
//   State<QRcodeScanner> createState() => _QRcodeScannerState();
// }
//
// class _QRcodeScannerState extends State<QRcodeScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   List<String> results = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 5,
//           child: QRView(
//             key: qrKey,
//             onQRViewCreated: _onQRViewCreated,
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() {
//         results.insert(0, scanData.code!);
//       });
//     });
//   }
// }
