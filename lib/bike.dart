class Bike {
  final int id;
  String name;
  String type;
  String size;
  String owner;
  String status;

  Bike({
    this.id,
    this.name,
    this.type,
    this.size,
    this.owner,
    this.status
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        size: json['size'],
        owner: json['owner'],
        status: json['status']
    );
  }
}

