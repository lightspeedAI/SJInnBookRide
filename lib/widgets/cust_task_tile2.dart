import 'package:book_a_ride/widgets/net_image.dart';
import 'package:flutter/material.dart';
import 'package:book_a_ride/models/car.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustTaskTile2 extends StatelessWidget {
  final Car car;
  final VoidCallback tapCall;
  CustTaskTile2({super.key, required this.car, required this.tapCall});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {          
            tapCall.call();         
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  // color: Colors.blue,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [NetImage(imgUrl: car.image1)],
                        ),
                      ),
                      Container(

                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.89,
                              child: Text(car.name),
                            ),
                            SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.89,
                              child: Text(
                                car.available ? "Available" : "Unavailable",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
