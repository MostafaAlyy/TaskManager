import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
          bottomSheetBackColor: Colors.white,
          viewType: ViewType.DAILY,
          toggleViewType: true,
          headerMonthElevation: 0),
      dayOptions: DayOptions(
          compactMode: true,
          disableFadeEffect: true,
          selectedTextColor: const Color(0xff5a55ca),
          todayBackgroundColor: Colors.white,
          selectedBackgroundColor: Colors.white,
          weekDaySelectedColor: const Color(0xff5a55ca),
          disableDaysBeforeNow: true),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: Colors.white,
          headerTextColor: Colors.black),
      onChangeDateTime: (datetime) {
        print(datetime.getDate());
      },
    );
  }
}
