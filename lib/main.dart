import 'package:ecommerce_app/core/configs/theme/app_theme.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/pages/splash.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await initializeDependencies();
    // var snapshot =
    //     await FirebaseFirestore.instance.collection('Products').get();
    // log(snapshot.docs.map((e) => e.data()).toList().toString()); // Print data here
  } catch (e) {
    print('Error during initialization: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // log('Screen width: ${MediaQuery.of(context).size.width}');
    // log('Screen height: ${MediaQuery.of(context).size.height}');
    // print('Screen width: ${ScreenUtil().screenWidth}'); // Check screen width
    // print('Screen height: ${ScreenUtil().screenHeight}'); // Check screen height
    // print(
    //     'Text scaling factor: ${ScreenUtil().scaleText}'); // Check text scaling

    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 805.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => SplashCubit()..appStarted(),
            child: MaterialApp(
                theme: AppTheme.appTheme,
                debugShowCheckedModeBanner: false,
                home: const SplashPage()),
          );
        });
  }
}
