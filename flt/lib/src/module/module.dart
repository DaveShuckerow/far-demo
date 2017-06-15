import 'package:github.daveshuckerow.chat.flt/src/module/platform.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

/// Locator for all the services in the app.
class ServiceLocator {
  final RoomStore roomStore;

  final UserStore userStore;

  final MessageStore messageStore;

  final MessageMutator messageMutator;

  final Platform platform;

  ServiceLocator._(this.roomStore, this.userStore, this.messageStore,
      this.messageMutator, this.platform);

  factory ServiceLocator.real(FlutterPlatform platform) {
    return new ServiceLocator._(
        new RoomStore(platform),
        new UserStore(platform),
        new MessageStore(platform),
        new MessageMutator(platform),
        platform);
  }

  factory ServiceLocator.fake() {
    var messageMutator = new MessageMutatorFake();
    return new ServiceLocator._(
        new RoomStoreFake(messageMutator),
        new UserStoreFake(),
        new MessageStoreFake(messageMutator),
        messageMutator,
        new FlutterPlatformFake());
  }
}

ServiceLocator service;
