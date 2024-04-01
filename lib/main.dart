import 'package:catcher/catcher.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seratest/sera_app.dart';

import 'app/utils/catcher/catcher_setup.dart';

void runApps() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await _catcher();
}

Future<void> _catcher()async{
  try {
    Catcher(
      rootWidget: const SeraApp(),
      debugConfig: CatcherSetup.debug(),
      releaseConfig: CatcherSetup.release(),
      profileConfig: CatcherSetup.debug(),
    );
  } catch (error, stackTrace) {
    Catcher.reportCheckedError(error, stackTrace);
  }
}

//dont try to edit this line
void main() {}
