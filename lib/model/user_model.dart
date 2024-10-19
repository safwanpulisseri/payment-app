class UserModel {
  String name;
  String profilePictureUrl;
  String paymentMethod; // 'Cash' or 'UPI'
  double paymentAmount;

  UserModel({
    required this.name,
    required this.profilePictureUrl,
    this.paymentMethod = 'Cash',
    this.paymentAmount = 2500,
  });
}
