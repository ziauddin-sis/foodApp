import 'dart:convert';

class Outlet{

   final int id;
   final String outletName;
   final String outletCode;
   final String address;
   final String phone;
   final String invoicePrint;
   final String startingDate;
   final String invoiceFooter;
   final String collectTax;
   final String preOrPostOrder;
   final int userId;
   final int companyId;
   final String delStatus;

   Outlet({this.id,
      this.outletName,
      this.outletCode,
      this.address,
      this.phone,
      this.invoicePrint,
      this.startingDate,
      this.invoiceFooter,
      this.collectTax,
      this.preOrPostOrder,
       this.userId,
      this.companyId,
      this.delStatus});

   Outlet.fromJson(Map<String, dynamic> json)
    :
       id = int.parse(json['id']),
       outletName = json['outlet_name'],
       outletCode = json['outlet_code'],
       address = json['address'],
       phone = json['phone'],
       invoicePrint = json['invoice_print'],
       startingDate = json['starting_date'],
       invoiceFooter = json['invoice_footer'],
       collectTax = json['collect_tax'],
       preOrPostOrder = json['pre_or_post_payment'],
       userId = int.parse(json['user_id']),
       companyId = int.parse(json['company_id']),
       delStatus = json['del_status'];

   @override
  String toString() {
    return 'Outlet{id: $id, outletName: $outletName, outletCode: $outletCode, address: $address, phone: $phone, invoicePrint: $invoicePrint, startingDate: $startingDate, invoiceFooter: $invoiceFooter, collectTax: $collectTax, preOrPostOrder: $preOrPostOrder, userId: $userId, companyId: $companyId, delStatus: $delStatus}';
  }
}