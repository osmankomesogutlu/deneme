class CardModel {
  late String id;
  late String cardHolderName;
  late String cardNumber;
  late String cvvCode;
  late String expiryDate;

  CardModel({
    required this.id,
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvvCode,
    required this.expiryDate,
  });

  CardModel.fromMap(Map<String, dynamic> snapshot) {
    id = snapshot['id'];
    cardHolderName = snapshot['cardHolderName'];
    cardNumber = snapshot['cardNumber'];
    expiryDate = snapshot['expiryDate'];
    cvvCode = snapshot['cvvCode'];
  }

  Map toJson() => {
        'id': id,
        'cardHolderName': cardHolderName,
        'cardNumber': cardNumber,
        'cvvCode': cvvCode,
        'expiryDate': expiryDate,
      };
}
