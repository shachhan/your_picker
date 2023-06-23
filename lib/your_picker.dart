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
  }) async {
    initialYear ??= DateTime.now().year;
    final List<int> years = getYears(initialYear, count);
    // DateTime? result;

    var yearPicker = Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
        width: 200, height: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(cancelText),
                  ),
                  Text(title),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(confirmText),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: years.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(years[index].toString(), textAlign: TextAlign.center,),
                    onTap: () {
                      Navigator.pop(context, DateTime(years[index]));
                    },
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
    int count = 3,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    String title = "Select Year",
  }) async {
    initialYear ??= DateTime.now().year;
    int selectedYear = initialYear;

    var quarterPicker = StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: SizedBox(
            width: 200, height: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(cancelText),
                      ),
                      Text(title),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(confirmText),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 50,
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
                      Text(selectedYear.toString()),
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
                        title: Text(tileText, textAlign: TextAlign.center,),
                        onTap: () {
                          Navigator.pop(context, DateTime(selectedYear, index * 3 + 1));
                        },
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
    int count = 3,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    String title = "Select Year",
  }) async {
    initialYear ??= DateTime.now().year;
    int selectedYear = initialYear;

    var halfPicker = StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: SizedBox(
            width: 200, height: 220,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(cancelText),
                      ),
                      Text(title),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(confirmText),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 50,
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
                      Text(selectedYear.toString()),
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
                        title: Text(tileText, textAlign: TextAlign.center,),
                        onTap: () {
                          Navigator.pop(context, DateTime(selectedYear, index * 6 + 1));
                        },
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
