class CustomerModel {
  final String customerName;
  final int id;

  CustomerModel({required this.customerName,required this.id});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        
        customerName: json['CustomerName'],
        id: json['Id']);
  }
}
