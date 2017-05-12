import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

class SubscribingComponent implements OnInit, OnDestroy {
  final List<Store> subscriptions;

  SubscribingComponent(this.subscriptions);

  @override
  void ngOnInit() {
    for (var store in subscriptions) {}
  }

  @override
  void ngOnDestroy() {
    for (var store in subscriptions) {}
  }
}
