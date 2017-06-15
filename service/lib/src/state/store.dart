import 'dart:async';
import 'package:meta/meta.dart';

import 'publisher.dart';

/// A simple version of a store that listens to Firebase.
///
/// Each store retrieves data by a parameter, `P`, and returns it as a data
/// type `D`.
///
/// The store provides a builtin cache system.
///
/// With firebase's realtime database, data can be updated constantly.  To avoid
/// too much network use, we only subscribe to real-time updates on the
/// most-recently used channel.
abstract class Store<P, D> extends Publisher {
  D get(final P param) {
    if (_cache[param] == null && _activeChannelKey != param) {
      // The cache for this parameter is empty and we are not listening for
      // updates.  We'll close that stream after it provides a single value,
      // and subscribe to updates for the new parameter immediately.
      _cancelAfterData(_activeChannelKey, _activeChannel);
      _activeChannelKey = param;
      _activeChannel = load(param).listen((data) => _updateCache(param, data));
    }
    return _cache[param];
  }

  @protected
  Stream<D> load(P param);

  void _updateCache(P param, D data) {
    _cache[param] = data;
    notify();
  }

  void clearCache() {
    _cache.clear();
    notify();
  }

  final Map<P, D> _cache = {};

  /// With Firebase's realtime database,
  P _activeChannelKey;
  StreamSubscription<D> _activeChannel;

  void _cancelAfterData(
      final P oldChannelKey, final StreamSubscription<D> oldChannel) {
    if (oldChannel != null) {
      oldChannel.onData((data) {
        _updateCache(oldChannelKey, data);
        oldChannel.cancel();
      });
      oldChannel.onError((_) => oldChannel.cancel());
    }
  }
}
