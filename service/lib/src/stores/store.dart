import 'package:fixnum/fixnum.dart';

/// A simple version of a store.
///
/// Each store retrieves data by a parameter, `P`, and returns it as a data
/// type `R`.
///
/// The store provides a builtin cache system.
abstract class Store<P, D> {
  Response<D> get(P param);
}

class Response<D> {
  final D data;
  final Error error;

  Response(this.data, this.error);
}

enum ResponseStatus { loading, complete, error }
