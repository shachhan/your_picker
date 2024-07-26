library your_picker;

import 'package:flutter/material.dart';

class YourPicker {
  static List<int> getYears(int initialYear, int count) {
    List<int> years = [];
    for (int i = 0; i < count ; i++) {
      years.add(initialYear - i);
    }
    return years;
  }

  static Future<DateTime?> showYearPicker({
    required BuildContext context,
    int? initialYear,
    int count = 3,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    String title = "Select Year",
    TextStyle titleStyle = const TextStyle(fontSize: 16),
    double w = 200,
    double h = 250,
    double headerHeight = 50,
    double contentHeight = 40,
    TextStyle contentStyle = const TextStyle(fontSize: 16),
  }) async {
    initialYear ??= DateTime.now().year;
    final List<int> years = getYears(initialYear, count);
    // DateTime? result;

    var yearPicker = Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
        width: w, height: h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: headerHeight,
              child: Center(child: Text(title, style: titleStyle, textAlign: TextAlign.center,)),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: years.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context, DateTime(years[index]));
                    },
                    titleTextStyle: contentStyle,
                    title: Text(years[index].toString(), textAlign: TextAlign.center,),
                    minTileHeight: contentHeight,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    final result = await showDialog<DateTime?>(context: context, builder: (_) => yearPicker);
    return result;
  }


  static Future<DateTime?> showQuarterPicker({
    required BuildContext context,
    int? initialYear,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    String title = "Select Year",
    TextStyle titleStyle = const TextStyle(fontSize: 16),
    double w = 200,
    double h = 350,
    double headerHeight = 50,
    double contentHeight = 40,
    TextStyle contentStyle = const TextStyle(fontSize: 16),
  }) async {
    initialYear ??= DateTime.now().year;
    int selectedYear = initialYear;

    var quarterPicker = StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: SizedBox(
            width: w, height: h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: headerHeight,
                  child: Center(child: Text(title, style: titleStyle, textAlign: TextAlign.center,)),
                ),
                const Divider(),
                SizedBox(
                  height: headerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // year change -1
                          setState(() {
                            selectedYear -= 1;
                          });
                        },
                        child: const Text('◀'),
                      ),
                      Text(selectedYear.toString(), style: contentStyle,),
                      TextButton(
                        onPressed: () {
                          // year change +1
                          setState(() {
                            selectedYear += 1;
                          });
                        },
                        child: const Text('▶'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      String tileText = '${index+1} 분기';
                      return ListTile(
                        onTap: () {
                          Navigator.pop(context, DateTime(selectedYear, index * 3 + 1));
                        },
                        titleTextStyle: contentStyle,
                        title: Text(tileText, textAlign: TextAlign.center,),
                        minTileHeight: contentHeight,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );

    final result = await showDialog<DateTime?>(context: context, builder: (_) => quarterPicker);
    return result;
  }

  static Future<DateTime?> showHalfPicker({
    required BuildContext context,
    int? initialYear,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    String title = "Select Year",
    TextStyle titleStyle = const TextStyle(fontSize: 16),
    double w = 200,
    double h = 220,
    double headerHeight = 50,
    double contentHeight = 40,
    TextStyle contentStyle = const TextStyle(fontSize: 16),
  }) async {
    initialYear ??= DateTime.now().year;
    int selectedYear = initialYear;

    var halfPicker = StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: SizedBox(
            width: w, height: h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: headerHeight,
                  child: Center(child: Text(title, style: titleStyle, textAlign: TextAlign.center,)),
                ),
                const Divider(),
                SizedBox(
                  height: headerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // year change -1
                          setState(() {
                            selectedYear -= 1;
                          });
                        },
                        child: const Text('◀'),
                      ),
                      Text(selectedYear.toString(), style: contentStyle),
                      TextButton(
                        onPressed: () {
                          // year change +1
                          setState(() {
                            selectedYear += 1;
                          });
                        },
                        child: const Text('▶'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      String tileText = index == 0 ? '상반기' : '하반기';
                      return ListTile(
                        onTap: () {
                          Navigator.pop(context, DateTime(selectedYear, index * 6 + 1));
                        },
                        titleTextStyle: contentStyle,
                        title: Text(tileText, textAlign: TextAlign.center,),
                        minTileHeight: contentHeight,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );

    final result = await showDialog<DateTime?>(context: context, builder: (_) => halfPicker);
    return result;
  }
}
