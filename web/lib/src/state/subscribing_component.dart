import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:meta/meta.dart';

/// Handler for subscriptions to the app's state.
///
/// Manages subscriptions to [Store]s and calls `refresh` when a store's data
/// updates
///
/// Unsubscribes when the component is destroyed.
abstract class SubscribingComponent implements OnInit, OnDestroy {
  final List<Store> subscriptions;

  SubscribingComponent(this.subscriptions);

  void refresh();

  @mustCallSuper
  @override
  void ngOnInit() {
    print('Init');
    for (var store in subscriptions) {
      store.subscribe(this, refresh);
    }
    // Try to load data.
    refresh();
  }

  @mustCallSuper
  @override
  void ngOnDestroy() {
    for (var store in subscriptions) {
      store.unsubscribe(this);
    }
  }
}
