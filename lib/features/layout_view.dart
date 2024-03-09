import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/settings_provider.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/config/app_theme_manager.dart';

class LayoutView extends StatelessWidget {
  static String routeName = "Layout View";
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<SettingsProvider>(context);
    var lang=AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  const SystemUiOverlayStyle(
        statusBarColor: ApplicationThemeManager.primaryColor,
      ),
      child: Scaffold(extendBody: true,
        body: vm.screens[vm.currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(

          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: vm.currentIndex,
            onTap: vm.changeIndex,
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: lang.list,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: lang.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
