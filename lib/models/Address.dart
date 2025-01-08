class Address {
  String street; // Tên đường
  String city; // Thành phố
  String district; // Quận / huyện
  String postalCode; // Mã bưu chính
  String country; // Quốc gia

  Address({
    required this.street,
    required this.city,
    required this.district,
    required this.postalCode,
    required this.country,
  });
}
