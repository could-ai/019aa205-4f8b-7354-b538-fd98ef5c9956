import 'package:flutter/material.dart';
import '../models/shift.dart';
import '../widgets/shift_card.dart';

class MyShiftsScreen extends StatelessWidget {
  const MyShiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه شیفت‌ها'),
      ),
      body: ListView.builder(
        itemCount: mockShifts.length,
        itemBuilder: (context, index) {
          return ShiftCard(shift: mockShifts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement shift request
        },
        label: const Text('درخواست شیفت جدید'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
