import 'package:flutter/material.dart';
import 'package:flutter_provider/core/models/user.dart';
import 'package:flutter_provider/core/services/authentication_service.dart';
import 'package:flutter_provider/locator.dart';
import 'package:flutter_provider/ui/router.dart';
import 'package:flutter_provider/ui/views/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView(),
        initialRoute: initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
