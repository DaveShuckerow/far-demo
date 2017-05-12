import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

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

  @override
  void ngOnInit() {
    for (var store in subscriptions) {
      store.subscribe(this, refresh);
    }
  }

  @override
  void ngOnDestroy() {
    for (var store in subscriptions) {
      store.unsubscribe(this);
    }
  }
}
