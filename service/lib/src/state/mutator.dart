import 'dart:async';
import 'store.dart';

abstract class Mutator<T> {
  final List<Store> toInvalidate;

  Mutator(this.toInvalidate);

  Future<Error> submit(T newEntity);
}
