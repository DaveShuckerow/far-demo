import 'package:angular2/platform/browser.dart';

import 'package:github.daveshuckerow.chat.web/src/components/app/app.dart';
import 'package:github.daveshuckerow.chat.web/src/module/module.dart';

main() {
  print('starting the app up.');
  bootstrap(AppComponent, fakeBindings);
}
