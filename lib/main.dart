import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_int/navigation/navigation_service.dart';
import 'package:ourpass_int/navigation/router.dart';
import 'package:ourpass_int/presentation/view_models/user_vm.dart';
import 'package:ourpass_int/presentation/views/sign_up.dart';
import 'package:ourpass_int/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injector();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: Ourpass(),
    ),
  );
}

class Ourpass extends StatelessWidget {
  final _navService = inject<NavigationHandler>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      navigatorKey: _navService.navigatorKey,
      home: SignUpPage(),
    );
  }
}
