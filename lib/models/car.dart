class Car {
  String name;
  String specs;
  bool available;
  String image1;
  String image2;
  String image3;
  String mobno;
  

  Car({
    required this.name,
    required this.specs,
    required this.available,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.mobno,
    });

  Car.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          specs: json['specs']! as String,
          available: json['available']! as bool,
          image1: json['image1']! as String,
          image2: json['image2']! as String,
          image3: json['image3']! as String,
          mobno: json['mobno']! as String,
        );

  Car copyWith({
    String? name,
    String? specs,
    bool? available,
    String? image1,
    String? image2,
    String? image3,
    String? mobno,
  }) {
    return Car(
        name: name ?? this.name,
        specs: specs ?? this.specs,
        available: available ?? this.available,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2,
        image3: image3 ?? this.image3,
        mobno: mobno ?? this.mobno
        );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'specs': specs,
      'available': available,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'mobno': mobno,
    };
  }
}
