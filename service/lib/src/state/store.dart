import 'dart:async';
import 'package:meta/meta.dart';

import 'publisher.dart';

/// A simple version of a store.
///
/// Each store retrieves data by a parameter, `P`, and returns it as a data
/// type `D`.
///
/// The store provides a builtin cache system.
abstract class Store<P, D> extends Publisher {
  D get(P param) {
    if (_cache[param] == null) {
      load(param).then((data) {
        _cache[param] = data;
        notify();
      });
    }
    return _cache[param];
  }

  @protected
  Future<D> load(P param);

  void clearCache() {
    _cache.clear();
    print("notifying!");
    notify();
  }

  final Map<P, D> _cache = {};
}
