class ColumnTypes {
  // CREATE A LIST (CONTAINING ONLY COLUMN TYPE)
  // BELOW THE COLUMNTYPES LIST
  // THEN ADD THAT LIST VARIABLE IN COLUMNTYPES LIST.
  // COLUMN TYPES SHOULD MATCH THE INDEX VALUE OF COLUMN IN COLUMNS LIST CLASS,
  static const List<List<String>> columnTypes = [
    users,
    userTypes,
    categories,
    products,
    productPrices,
    invoices,
    salesman,
    appSettings,
    customerGroups,
    customer,
    orderMaster,
    orderDetail,
  ];
  static const List<String> users = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> userTypes = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> categories = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> products = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> productPrices = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> invoices = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> salesman = [
    'integer primary key',
    'text',
    'text',
    'text'
  ];
  static const List<String> appSettings = ['integer primary key', 'text'];
  static const List<String> customerGroups = [
    'integer primary key',
    'text',
    'text',
  ];
  static const List<String> customer = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> orderMaster = [
    'integer primary key',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
  static const List<String> orderDetail = [
    'integer primary key',
    'integer',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text'
  ];
}
