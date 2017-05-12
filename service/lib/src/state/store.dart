import 'dart:async';
import 'package:meta/meta.dart';

typedef void VoidCallback();

/// A simple version of a store.
///
/// Each store retrieves data by a parameter, `P`, and returns it as a data
/// type `D`.
///
/// The store provides a builtin cache system.
abstract class Store<P, D> {
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

  @protected
  void notify() {
    for (var subscriber in _subscribers.keys) {
      _subscribers[subscriber]();
    }
  }

  void subscribe(Object subscriber, VoidCallback onData) {
    _subscribers[subscriber] = onData;
  }

  void unsubscribe(Object subscriber) {
    _subscribers.remove(subscriber);
  }

  final Map<P, D> _cache = {};
  final Map<Object, VoidCallback> _subscribers = {};
}
