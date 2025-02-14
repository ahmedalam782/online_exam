import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/Themes/app_theme.dart';
import 'package:online_exam/core/di/service_locator.dart';
import 'package:online_exam/core/resources/values_manager.dart';
import 'package:online_exam/core/routes/route_generator.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/core/utils/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  runApp(EasyLocalization(
    supportedLocales: AppConstants.supportedLocales,
    fallbackLocale: AppConstants.englishLocale,
    path: AppConstants.pathTranslation,
    child: const OnlineExam(),
  ));
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Online Exam',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}
