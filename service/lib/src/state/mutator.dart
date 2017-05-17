import 'dart:async';

import 'publisher.dart';

abstract class Mutator<D> extends Publisher {
  Future<Error> submit(D newEntity);
}
