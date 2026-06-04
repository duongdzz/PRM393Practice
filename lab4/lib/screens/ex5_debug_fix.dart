import 'package:flutter/material.dart';

class Ex5DebugFix extends StatefulWidget {
  const Ex5DebugFix({super.key});

  @override
  State<Ex5DebugFix> createState() =>
      _Ex5DebugFixState();
}

class _Ex5DebugFixState
    extends State<Ex5DebugFix> {

  double sliderValue = 50;

  DateTime? selectedDate;

  final List<String> items = List.generate(
    20,
        (index) => "Item ${index + 1}",
  );

  Future<void> selectDate() async {
    DateTime? pickedDate =
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 5"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 600,

            child: Column(
              children: [

                const Text(
                  "Fix #1: ListView in Column",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (
                        context,
                        index,
                        ) {
                      return ListTile(
                        title: Text(
                          items[index],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Slider Value: "
                      "${sliderValue.toStringAsFixed(0)}",
                ),

                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (value) {

                    // Fix #3 setState()

                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),

                ElevatedButton(
                  onPressed: selectDate,
                  child: const Text(
                    "Select Date",
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  selectedDate == null
                      ? "No Date Selected"
                      : selectedDate.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}