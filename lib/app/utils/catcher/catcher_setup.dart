import 'package:catcher/catcher.dart';

class CatcherSetup extends CatcherOptions {
  CatcherSetup(super.reportMode, super.handlers);

  factory CatcherSetup.debug() => CatcherSetup(SilentReportMode(),
      [ConsoleHandler(), 
     // if (!kDebugMode) CrashlyticsHandler()
      ]);

  factory CatcherSetup.release() => CatcherSetup(
        SilentReportMode(),
        [
         // CrashlyticsHandler()

          /// enable this if you need send report to Sentry
          /// SentryHandler(SentryClient("YOUR_DSN_HERE"))
        ],
      );
}
