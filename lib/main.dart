import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final String Number=  "0740870184";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       /*   Container(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: textEditingController,
              onSaved: (phoneNumber) {
                textEditingController.text = phoneNumber;
              },
            ),
          ),*/
          RaisedButton(
            child: Text("_launchPhoneURL"),
            onPressed: () {
              _launchPhoneURL(Number);
            },
          ),
          RaisedButton(
            child: Text("_callNumber"),
            onPressed: () {
              _callNumber(Number);
            },
          )
        ],
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  final String Number=  "0740870184";
  String number =Number ;


  await FlutterPhoneDirectCaller.callNumber(number);
}

_launchPhoneURL(String phoneNumber) async {

  String url = 'tel:' + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
