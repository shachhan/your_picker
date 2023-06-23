import 'package:flutter/material.dart';
import 'package:your_picker/your_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime initDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Picker example")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async {
                DateTime? result = await YourPicker.showYearPicker(
                  context: context,
                  initialYear: initDate.year,
                  title: "연도 선택",
                  confirmText: "확인",
                  cancelText: "취소",
                );
                if (result != null) {
                  setState(() {
                    selectedDate = result;
                  });
                }
              },
              child: const Text("Show Year Picker"),
            ),
            const SizedBox(height: 20,),
            Text(selectedDate.year.toString()),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                DateTime? result = await YourPicker.showQuarterPicker(
                  context: context,
                  initialYear: initDate.year,
                  title: "분기 선택",
                  confirmText: "확인",
                  cancelText: "취소",
                );
                if (result != null) {
                  setState(() {
                    selectedDate = result;
                  });
                }
              },
              child: const Text("Show Quarter Picker"),
            ),
            const SizedBox(height: 20,),
            Text(selectedDate.toString()),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                DateTime? result = await YourPicker.showHalfPicker(
                  context: context,
                  initialYear: initDate.year,
                  title: "반기 선택",
                  confirmText: "확인",
                  cancelText: "취소",
                );
                if (result != null) {
                  setState(() {
                    selectedDate = result;
                  });
                }
              },
              child: const Text("Show Half Picker"),
            ),
            const SizedBox(height: 20,),
            Text(selectedDate.toString()),
          ],
        ),
      )
    );
  }
}
