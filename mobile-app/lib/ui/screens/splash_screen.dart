import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../core/services/auth_service.dart';
import '../../locator.dart';
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  // final _dbService = locator<DatabaseService>();
  // final _localStorateService = locator<LocalStorageService>();
  // final _notificationService = locator<NotificationsService>();

  final Logger log = Logger();

  // @override
  // void didChangeDependencies() {
  //   _initialSetup();
  //   super.didChangeDependencies();
  // }

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 3));
    // await _localStorateService.init();

    ////
    ///initializing notification services
    ///
    // await NotificationsService().initConfigure();
    // var fcm = await NotificationsService().getFcmToken();
    // print("FCM TOKEN is =====> $fcm");
    // await _notificationService.initConfigure();

    // await _authService.doSetup();
    ////
    ///checking if the user is login or not
    ///
    // log.d('Login State: ${_authService.isLogin}');
    // if (_authService.isLogin) {
    //   Get.off(() => RootScreen());
    // } else {
    //   // Get.off(() => LoginScreen());
    Get.to(() => OnboardingScreen());
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
