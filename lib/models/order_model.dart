class OrderModel {
  final String id;
  final String date;
  final String status;

  OrderModel({
    required this.id,
    required this.date,
    required this.status,
  });

  factory OrderModel.fromJson(json) {
    return OrderModel(
      id: json['id_order'] ,
      date: json['date_order'],
      status: json['status_order'],
    );
  }
}

