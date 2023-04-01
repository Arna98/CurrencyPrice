class CurrencyDataModel{
  String? _id;
  String? _title;
  String? _price;
  String? _changes;
  String? _status;
  
  set setId(String? id) => _id = id;

  String? get getId => _id;
  
  set setTitle(String? title ) => _title = title;

  String? get getTitle => _title;

  set setPrice(String? price) => _price = price;

  String? get getPrice => _price;

  set setChanges(String? changes) => _changes = changes;

  String? get getChanges => _changes;

  set setStatus(String? status) => _status = status;

  String? get getStatus => _status;
}