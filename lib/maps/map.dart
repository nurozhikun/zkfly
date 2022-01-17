// 根据value获取key
T mapKey<T>(Map<T, dynamic> cur, dynamic value) {
  T curKey = cur.keys.firstWhere((k) => cur[k] == value);
  return curKey;
}
