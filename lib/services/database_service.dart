import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_a_ride/models/car.dart';

const String CAR_COLLECTON_REF = "cars";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _carsRef;

  DatabaseService() {
    _carsRef = _firestore.collection(CAR_COLLECTON_REF).withConverter<Car>(
        fromFirestore: (snapshots, _) => Car.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (car, _) => car.toJson());
  }

  Stream<QuerySnapshot> getCars() {
    return _carsRef.snapshots();
  }

  void addCar(Car car) async {
    _carsRef.add(car);
  }

  void updateCar(String carId, Car car) {
    _carsRef.doc(carId).update(car.toJson());
  }

  // void deleteCar(String carId) {
  //   _carsRef.doc(carId).delete();
  // }
}
