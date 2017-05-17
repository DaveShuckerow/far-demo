import 'package:meta/meta.dart';

typedef void VoidCallback();

class Publisher {
  final Map<Object, VoidCallback> _subscribers = {};

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
}
