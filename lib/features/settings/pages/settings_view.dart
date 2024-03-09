import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/features/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/config/app_theme_manager.dart';

class SettingsView extends StatelessWidget {
  final List<String> languageList = ["English", "عربي"];
  final List<String> themeList = ["Dark", "Light"];

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
              start: 40,
              top: 60,
            ),
            color: ApplicationThemeManager.primaryColor,
            width: mediaQuery.width,
            height: mediaQuery.height * 0.2,
            child: Text(
              lang.settings,
              style: vm.isDark()
                  ? theme.textTheme.titleLarge
                  : theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.language,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: vm.isDark() ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                CustomDropdown<String>(
                  items: languageList,
                  initialItem: vm.currentLang == "en" ? "English" : "عربي",
                  onChanged: (value) {
                    if (value == "English") {
                      vm.changeLanguage("en");
                    } else if (value == "عربي") {
                      vm.changeLanguage("ar");
                    }
                  },
                  decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.zero,
                    closedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    expandedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    listItemStyle: theme.textTheme.displayLarge?.copyWith(
                        color: ApplicationThemeManager.primaryColor,
                        fontWeight: FontWeight.w400),
                    headerStyle: theme.textTheme.displayLarge?.copyWith(
                        color: ApplicationThemeManager.primaryColor,
                        fontWeight: FontWeight.w400),
                    closedSuffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: ApplicationThemeManager.primaryColor,
                    ),
                    expandedSuffixIcon: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: ApplicationThemeManager.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                Text(lang.mode,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: vm.isDark() ? Colors.white : Colors.black,
                    )),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                CustomDropdown(
                  items: themeList,
                  initialItem: vm.isDark() ? "Dark" : "Light",
                  decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.zero,
                    closedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    expandedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    headerStyle: theme.textTheme.displayLarge?.copyWith(
                        color: ApplicationThemeManager.primaryColor,
                        fontWeight: FontWeight.w400),

                    // const TextStyle(color: ApplicationThemeManager.primaryColor),
                    listItemStyle: theme.textTheme.displayLarge?.copyWith(
                        color: ApplicationThemeManager.primaryColor,
                        fontWeight: FontWeight.w400),
                    closedSuffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: ApplicationThemeManager.primaryColor,
                    ),
                    expandedSuffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: ApplicationThemeManager.primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    if (value == "Dark") {
                      vm.changeTheme(ThemeMode.dark);
                    } else if (value == "Light") {
                      vm.changeTheme(ThemeMode.light);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
