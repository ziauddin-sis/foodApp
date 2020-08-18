class Customers{

   final int id;
   final String name;
   final String phone;
   final String email;
   final String address;
   final String gstNumber;
   final int areaId;
   final int userId;
   final int companyId;
   final String delStatus;
   final String dateOfBirth;
   final String dateOfAnniversary;

   Customers.fromJson(Map<String, dynamic> json)
  :
   id = int.parse(json['id']),
   name = json['name'],
   phone = json['phone'],
   email = json['email'],
   address = json['address'],
   gstNumber = json['gst_number'],
   areaId = json['area_id'] == null ? 0 : int.parse(json['area_id']),
   userId = json['user_id'] == null ? 0 : int.parse(json['user_id']),
   companyId = int.parse(json['company_id']),
   delStatus = json['del_status'],
   dateOfBirth = json['date_of_birth'],
   dateOfAnniversary = json['date_of_anniversary'];

   Customers(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.gstNumber,
      this.areaId,
      this.userId,
      this.companyId,
      this.delStatus,
      this.dateOfBirth,
      this.dateOfAnniversary});

   @override
  String toString() {
    return 'Customers{id: $id, name: $name, phone: $phone, email: $email, address: $address, gstNumber: $gstNumber, areaId: $areaId, userId: $userId, companyId: $companyId, delStatus: $delStatus, dateOfBirth: $dateOfBirth, dateOfAnniversary: $dateOfAnniversary}';
  }
}