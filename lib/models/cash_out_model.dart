class CashOut {
  final String? id;
  final String? amount;
  final String? status;
  final String? remarks;
  final String? ewalletName;
  final String? ewalletNumber;
  final String? date;

  CashOut({
    this.id,
    this.amount,
    this.status,
    this.remarks,
    this.ewalletName,
    this.ewalletNumber,
    this.date,
  });

  factory CashOut.fromJson(Map<String, dynamic> json) {
    return CashOut(
      id: json['id'],
      amount: json['amount'],
      status: json['status'],
      remarks: json['remarks'],
      ewalletName: json['ewalletName'],
      ewalletNumber: json['ewalletNumber'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'status': status,
      'remarks': remarks,
      'ewalletName': ewalletName,
      'ewalletNumber': ewalletNumber,
      'date': date,
    };
  }
}
