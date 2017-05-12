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
      });
    }
    return _cache[param];
  }

  @protected
  Future<D> load(P param);

  void subscribe(Object subscriber, VoidCallback onData) {
    _subscribers[subscriber] = onData;
  }

  void unsubscribe(Object subscriber) {
    _subscribers.remove(subscriber);
  }

  final Map<P, D> _cache = {};
  final Map<Object, VoidCallback> _subscribers = {};
}

/// A wrapper of all subscription-related behavior to a store.
// TODO: create Flutter and Angular-specific subscribers that adapt the
// subscription to the framework's lifecycle.
abstract class StoreSubscriber {
  void onStoreUpdate();

  List<Store> get subscriptions;
}
