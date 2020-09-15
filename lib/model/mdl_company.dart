class Company {
  final int id;
  final String currency;
  final String timezone;
  final String dateFormat;
  final int outletId;
  final String name;
  final String email;
  final String phone1;
  final String phone2;
  final String address;
  final String status;
  final String dateAdded;
  final String expiryDate;
  final String token;

  Company(
      {this.id,
      this.currency,
      this.timezone,
      this.dateFormat,
      this.outletId,
      this.name,
      this.email,
      this.phone1,
      this.phone2,
      this.address,
      this.status,
      this.dateAdded,
      this.expiryDate,
      this.token});

  Company.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        currency = json['currency'],
        timezone = json['timezone'],
        dateFormat = json['date_format'],
        outletId = int.parse(json['outlet_id']),
        name = json['name'],
        email = json['email'],
        phone1 = json['phone_1'],
        phone2 = json['phone_2'],
        address = json['address'],
        status = json['status'],
        dateAdded = json['date_added'],
        expiryDate = json['expiry_date'],
        token = json['token'];

  @override
  String toString() {
    return 'Company{id: $id, currency: $currency, timezone: $timezone, dateFormat: $dateFormat, outletId: $outletId, name: $name, email: $email, phone1: $phone1, phone2: $phone2, address: $address, status: $status, dateAdded: $dateAdded, expiryDate: $expiryDate, token: $token}';
  }
}
