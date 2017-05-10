import 'package:fixnum/fixnum.dart';

/// A simple version of a store.
///
/// Each store retrieves data by a parameter, `P`, and returns it as a data
/// type `D`.
///
/// The store provides a builtin cache system.
abstract class Store<P, D> {
  Response<D> get(P param);

  Map<P, Response<D>> _cache = <P, Response<D>>{};
}

/// A wrapper of all subscription-related behavior to a store.
// TODO: create Flutter and Angular-specific subscribers that adapt the
// subscription to the framework's lifecycle.
abstract class StoreSubscriber {
  void onStoreUpdate();

  List<Store> get subscriptions;
}

class Response<D> {
  final D data;
  final Error error;

  Response(this.data, this.error);

  bool get isLoading => data == null && error == null;

  bool get isLoaded => data != null && error == null;

  bool get isError => error != null;
}
