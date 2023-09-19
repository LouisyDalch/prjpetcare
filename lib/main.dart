import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prjpetcare/widstateless.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
  
main() {
  WidgetsFlutterBinding.ensureInitialized();  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const WidStateless(
    MaterialApp(

      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en'), // English
    Locale('pt'), // Spanish
  ],
    )
  ));
}
