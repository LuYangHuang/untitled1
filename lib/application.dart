import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:untitled1/pages/home/scoped_model/auto.dart';
import 'package:untitled1/routes.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();

    // FluroRouter router = FluroRouter();
    Routes.configRoutes(router);
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.green),
          onGenerateRoute: router.generator,
        ));
  }
}
