import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/features/settings_provider.dart';
import 'package:todo_app/features/tasks/widgets/task_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/config/app_theme_manager.dart';

class TasksView extends StatefulWidget {
  TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DateTime focusTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: const Alignment(0, 2),
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 40,
                  top: 60,
                ),
                // color: theme.primaryColor,
                color: ApplicationThemeManager.primaryColor,
                width: mediaQuery.width,
                height: mediaQuery.height * 0.2,
                child: Text(
                  lang.todoList,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              EasyInfiniteDateTimeLine(
                firstDate: DateTime(2023),
                focusDate: focusTime,
                lastDate: DateTime(2025),
                showTimelineHeader: false,
                timeLineProps: const EasyTimeLineProps(
                  separatorPadding: 20,
                ),

                dayProps: EasyDayProps(
                  height: 100,
                  inactiveDayStyle: DayStyle(
                    dayNumStyle: theme.textTheme.bodyMedium,

                    dayStrStyle: theme.textTheme.bodySmall,

                    monthStrStyle: theme.textTheme.bodySmall,
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0XFF141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0XFF141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  activeDayStyle: DayStyle(
                    dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: ApplicationThemeManager.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    dayStrStyle: theme.textTheme.bodySmall
                        ?.copyWith(color: ApplicationThemeManager.primaryColor),
                    monthStrStyle: theme.textTheme.bodySmall
                        ?.copyWith(color: ApplicationThemeManager.primaryColor),
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0XFF141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black38),
                    ),
                  ),
                ),

                onDateChange: (selectedDate) {
                  setState(() {
                    focusTime = selectedDate;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          Expanded(
            child: ListView(
              children: const [
                TaskItemWidget(),
                TaskItemWidget(),
                TaskItemWidget(),
                TaskItemWidget(),
                TaskItemWidget(),
                TaskItemWidget(),
                TaskItemWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
