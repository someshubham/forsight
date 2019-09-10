import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forsight/src/bloc/login_bloc.dart';
import 'package:forsight/src/bloc/login_provider.dart';
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
  LoginBloc bloc;
  String pictureAsset;
  @override
  initState() {
    super.initState();
    pictureAsset = 'assets/images/search.svg';
  }

  @override
  Widget build(BuildContext context) {
    bloc = LoginProvider.of(context);
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                pictureAsset,
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.5,
                colorBlendMode: BlendMode.color,
                color: Colors.lightBlue[50],
              ),
              SizedBox(
                height: 16,
              ),
              CreditScoreWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CupertinoButton(
                    color: Colors.white,
                    //textColor: Colors.white,
                    //splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text(
                      'START CAMERA SCAN',
                      style: TextStyle(color: Colors.cyan),
                    )),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      if (isNumeric(barcode)) {
        bloc.updateCEPoints(int.parse(barcode));
        setState(() => this.barcode = barcode);
      } else {
        setState(() {
          this.barcode = 'Invalid QR Code';
          this.pictureAsset = 'assets/images/authenticate.svg';
        });
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
          this.pictureAsset = 'assets/images/authenticate.svg';
        });
      } else {
        setState(() {
          this.barcode = 'Unknown error: $e';
          this.pictureAsset = 'assets/images/authenticate.svg';
        });
      }
    } on FormatException {
      setState(() {
        this.barcode = 'null';
        this.pictureAsset = 'assets/images/search.svg';
      });
    } catch (e) {
      setState(() {
        this.barcode = 'Unknown error: $e';
        this.pictureAsset = 'assets/images/authenticate.svg';
      });
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }

    return double.parse(s) != null || int.parse(s) != null;
  }
}
