import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/common/routes/app_pages.dart';

import 'common/services/global_config.dart';
import 'global.dart';

void main() async{
  await initServices();
  runApp(MyApp());
}
Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => GlobalConfigService().init());
  await Global.init();
  // await Get.putAsync(() => GlobalConfigService().init());
  // // await Get.putAsync(SettingsService()).init();
  print('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, (812-44-34.0)),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,

      ),
    );
  }
}
