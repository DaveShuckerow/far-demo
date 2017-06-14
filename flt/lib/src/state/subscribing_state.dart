import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

abstract class SubscribingState<T extends StatefulWidget> extends State<T> {
  final List<Store> subscriptions;

  SubscribingState(this.subscriptions);

  @override
  void initState() {
    super.initState();
    for (var store in subscriptions) {
      store.subscribe(this, _refresh);
    }
  }

  @override
  void dispose() {
    for (var store in subscriptions) {
      store.unsubscribe(this);
    }
    super.dispose();
  }

  void _refresh() {
    setState(() {});
  }
}
