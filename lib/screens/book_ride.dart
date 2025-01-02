import 'package:book_a_ride/constants/globals.dart';
import 'package:book_a_ride/constants/styles.dart';
import 'package:book_a_ride/models/car.dart';
import 'package:book_a_ride/widgets/cust_button2.dart';
import 'package:book_a_ride/widgets/cust_dialogue.dart';
import 'package:book_a_ride/widgets/net_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:book_a_ride/services/database_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math';

class BookRide extends StatelessWidget {
  Car selectedCar;
  String carId;
  BookRide({
    super.key,
    required this.selectedCar,
    required this.carId,
  });

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CarouselSlider(
                  items: [
                    NetImage(
                      imgUrl: selectedCar.image1,
                    ),
                    NetImage(
                      imgUrl: selectedCar.image2,
                    ),
                    NetImage(
                      imgUrl: selectedCar.image3,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(selectedCar.name),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(selectedCar.specs),
                    selectedCar.available
                        ? Text("Available")
                        : Text("Unavailable"),
                  ],
                ),
              ),
              CustButton2(
                  innerText: "Book Ride",
                  onTP: () async {
                    if (selectedCar.available) {
                      showAlert(context);
                    } else {
                      // showAnAlert(context);
                      Fluttertoast.showToast(
                        msg: "Car unavailable",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                    }
                  },
                  wid: MediaQuery.of(context).size.width * 0.94,
                  heig: MediaQuery.of(context).size.width * 0.15),
            ],
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext con) {
    showDialog(
        barrierDismissible: false,
        context: con,
        builder: (BuildContext context) {
          return CustDialogue(
              confText: "Book this Car?",
              fnOnAccept: bookRide,
              conButton: "Book a Ride");
        });
  }

  bookRide() async {
    // String uid = signedInUser!.user!.uid + random(20).toString();

    String uid = random(10000).toString();

    // FirebaseMessaging _firebaseMessaging =
    //     FirebaseMessaging.instance;
    // String? devRegToken = await _firebaseMessaging.getToken();
    // print("token is $devRegToken");

    

    Car updatedCar = selectedCar.copyWith(available: false, mobno: uid);
    _databaseService.updateCar(carId, updatedCar);

    Fluttertoast.showToast(
      msg: "Ride Booked Succesfully",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );    


    final url = 'https://wa.me/919021382870?text=bookingId:$uid';

    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );

    
  }

  int random( int max) {
    return 1 + Random().nextInt(max - 1);
  }
}
