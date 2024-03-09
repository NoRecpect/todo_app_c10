import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/login/pages/login_view.dart';
import 'package:todo_app/features/registure/pages/register_view.dart';
import 'package:todo_app/features/settings_provider.dart';
import 'package:todo_app/features/splash/pages/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/config/app_theme_manager.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return MaterialApp(

      title: "todo app",
      debugShowCheckedModeBanner: false,
      themeMode: vm.currentTheme,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      locale:Locale(vm.currentLang),
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        LoginView.routeName: (context) =>  LoginView(),
        RegisterView.routeName: (context) =>  RegisterView(),
      },
    );
  }
}
