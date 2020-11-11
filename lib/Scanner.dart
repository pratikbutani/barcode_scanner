import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan_preview/scan_preview_widget.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String barcode = "";

  bool refresh = false;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  _requestPermission() async {
    await Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Barcode Scanner"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height/1.5,
              child: ScanPreviewWidget(
                onScanResult: (result) {
                  debugPrint('scan result: $result');
                  setState(() {
                    barcode = result;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text(barcode))
          ],
        ));
  }
}
