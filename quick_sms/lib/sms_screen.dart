import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/sms.dart';
import 'package:sqflite_kullanimi/const/constant.dart';

class SmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    String number = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS GÖNDER"),
      ),
      body: Center(
        child: PhysicalModel(
          shadowColor: Colors.black,
          color: Colors.blue[400],
          elevation: 15.0,
          child: Container(
            height: Get.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    args,
                    style: TextStyle(fontSize: 21.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: Get.width * 0.5,
                    decoration: textFieldDecoration(),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Numarayı giriniz...",
                      ),
                      onChanged: (value) {
                        number = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    child: Text("GÖNDER"),
                    onPressed: () {
                      deneme(number, args);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deneme(String dd, String mesaj) {
    SmsSender sender = new SmsSender();
    String sendAdress = dd;
    String sendMessage = mesaj;
    SmsMessage message = new SmsMessage(sendAdress, sendMessage);
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS gönderildi!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS Teslim Edildi!");
      }
    });
    sender.sendSms(message);
    print(sendAdress);
    print(sendMessage);
  }
}
