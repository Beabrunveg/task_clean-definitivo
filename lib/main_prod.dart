import 'package:taks_daily_app/flavors.dart';
import 'package:taks_daily_app/main.dart' as runner;
/// Main function to run the app with the dev flavor.
Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
}
