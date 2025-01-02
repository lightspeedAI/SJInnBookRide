import 'package:book_a_ride/models/car.dart';
import 'package:book_a_ride/screens/book_ride.dart';
import 'package:book_a_ride/services/database_service.dart';
import 'package:book_a_ride/widgets/net_image.dart';
import 'package:flutter/material.dart';
import 'package:book_a_ride/constants/styles.dart';
import 'package:book_a_ride/widgets/cust_task_tile2.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> itemTiles = [];
  final DatabaseService _databaseService = DatabaseService();

  // Car newCar = Car(
  //     name: "Ford Mustang GT",
  //     specs: "460HP",
  //     available: true,
  //     image1: "https://images.pexels.com/photos/29016098/pexels-photo-29016098/free-photo-of-white-ford-mustang-with-custom-decals-in-ennis-tx.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  //     image2: "https://images.pexels.com/photos/21609688/pexels-photo-21609688/free-photo-of-shelby-ford-mustang.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  //     image3: "https://images.pexels.com/photos/14741506/pexels-photo-14741506.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");

  @override
  void initState() {
    // displayAllTasks();
    super.initState();
  }

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
            children: <Widget>[
              // ElevatedButton(onPressed: (){
              //   displayAllTasks();
              // }, child: Text("Add car"))

              Container(
                // color: Colors.red,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  width: MediaQuery.sizeOf(context).width,
                  child: StreamBuilder(
                    stream: _databaseService.getCars(),
                    builder: (context, snapshot) {
                      List cars = snapshot.data?.docs ?? [];
                      return ListView.builder(
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          Car car = cars[index].data();
                          String carId = cars[index].id;
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child:
                          CustTaskTile2(car: car, tapCall: (){
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BookRide(selectedCar: car, carId: carId,)),
                                );
                          }));
                          
                          // GestureDetector(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 BookRide(selectedCar: car, carId: carId,)),
                          //       );
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          //       child: ListTile(
                          //         tileColor: Theme.of(context)
                          //             .colorScheme
                          //             .primaryContainer,
                          //         title: NetImage(
                          //           imgUrl: car.image1,
                          //         ),
                          //         subtitle: Text(car.name),
                          //         trailing: car.available? Text(""): Text(""),
                          //       ),
                          //     ));
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }

  displayAllTasks() async {
    // _databaseService.addCar(newCar);

    // // List<Task> allTasks = await ComDB.showAllData();
    // List<Task> allTasks = [];
    // List<Widget> taskInfoTiles = [];
    // if (allTasks.isNotEmpty) {
    //   for (int j = 0; j < allTasks.length; j++) {
    //     taskInfoTiles.add(CustTaskTile2(
    //       task: allTasks[j],
    //       tapCall: reloadOnEdit,
    //     ));
    //     taskInfoTiles.add(const SizedBox(
    //       height: 10,
    //     ));
    //   }
    // }

    // itemTiles = taskInfoTiles;
    // setState(() {});
  }

  // reloadOnEdit() {
  //   displayAllTasks();
  // }
}
