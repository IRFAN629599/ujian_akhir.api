class DataItem {
  final String data;
  final String detail;
  final String password;

  DataItem({
    required this.data,
    required this.detail,
    required this.password,
  });
}

class UserStore {
  static final List<DataItem> _items = [];

  static List<DataItem> get items => _items;

  static List<DataItem> get semuaData =>
      List.unmodifiable(_items);

  static void tambah(DataItem item) {
    _items.add(item);
  }

  static bool hapus(int index) {
    if (index < 0 || index >= _items.length) {
      return false;
    }

    _items.removeAt(index);
    return true;
  }

  static bool edit(int index, DataItem item) {
    if (index < 0 || index >= _items.length) {
      return false;
    }

    _items[index] = item;
    return true;
  }
}
