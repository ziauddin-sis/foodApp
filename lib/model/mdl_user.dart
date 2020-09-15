class Users {
  final int id;
  final String fullName;
  final String phone;
  final String emailAddress;
  final String password;
  final String designation;
  final String willLogin;
  final String role;
  final int outletId;
  final int companyId;
  final String accountCreationDate;
  final String language;
  final String lastLogin;
  final String activeStatus;
  final String delStatus;

  Users(
      {this.id,
      this.fullName,
      this.phone,
      this.emailAddress,
      this.password,
      this.designation,
      this.willLogin,
      this.role,
      this.outletId,
      this.companyId,
      this.accountCreationDate,
      this.language,
      this.lastLogin,
      this.activeStatus,
      this.delStatus});

  Users.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        fullName = json['full_name'],
        phone = json['phone'],
        emailAddress = json['email_address'],
        password = json['password'],
        designation = json['designation'],
        willLogin = json['will_login'],
        role = json['role'],
        outletId = int.parse(json['outlet_id']),
        companyId = int.parse(json['company_id']),
        accountCreationDate = json['account_creation_date'],
        language = json['language'],
        lastLogin = json['last_login'],
        activeStatus = json['active_status'],
        delStatus = json['del_status'];

  @override
  String toString() {
    return 'Users{id: $id, fullName: $fullName, phone: $phone, emailAddress: $emailAddress, password: $password, designation: $designation, willLogin: $willLogin, role: $role, outletId: $outletId, companyId: $companyId, accountCreationDate: $accountCreationDate, language: $language, lastLogin: $lastLogin, activeStatus: $activeStatus, delStatus: $delStatus}';
  }
}
