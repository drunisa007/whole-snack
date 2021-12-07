import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whole_snack/core/utils/routes_pages.dart';
import 'package:whole_snack/core/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    await Hive.initFlutter(appDocPath);
  }
  await Hive.openBox('authBox');
  await Hive.openBox('apiBox');
  await Hive.openBox('customerBox');

  runApp(const MyApp());
/*  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return GetMaterialApp(
      title: 'Whole Snack',
      builder: DevicePreview.appBuilder,
      theme: StyleTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      getPages: RoutePage().routePage,
      initialRoute: '/',
    );
  }
}
