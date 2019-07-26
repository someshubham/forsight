import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:forsight/src/widgets/credit_score_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "Scanned Data will Appear here";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: new Container(
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              CreditScoreWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CupertinoButton(
                    color: Colors.cyanAccent[700],
                    //textColor: Colors.white,
                    //splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text('START CAMERA SCAN',style: TextStyle(color: Colors.white),)),
              ),
              Container(
                alignment: Alignment.center,
                child: QrImage(
                  data: "1234567890",
                  size: 200.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  barcode,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
