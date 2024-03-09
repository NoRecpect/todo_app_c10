import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/settings_provider.dart';
import '../../../core/config/app_theme_manager.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Container(
      width: mediaQuery.width,
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
       color: vm.isDark()?const Color(0XFF141922):Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 90,
            // color: theme.primaryColor,
            decoration: BoxDecoration(
              color: ApplicationThemeManager.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Play Basket Ball",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ApplicationThemeManager.primaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                   Icon(
                    Icons.alarm,
                    size: 20,
                    color: vm.isDark()?Colors.white:Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "10:30 Am",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ApplicationThemeManager.primaryColor,
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 35,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
