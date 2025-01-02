class Transaction {
  final String? id;
  final String? type;
  final double? amount;
  final String? status;
  final String? remarks;
  final DateTime? date;

  Transaction({
    this.id,
    this.type,
    this.amount,
    this.status,
    this.remarks,
    this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: json['type'],
      amount: json['amount'],
      status: json['status'],
      remarks: json['remarks'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'status': status,
      'remarks': remarks,
      'date': date?.toIso8601String(),
    };
  }
}
