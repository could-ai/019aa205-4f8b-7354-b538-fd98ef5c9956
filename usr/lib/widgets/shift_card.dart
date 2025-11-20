import 'package:flutter/material.dart';
import '../models/shift.dart';
import 'package:intl/intl.dart' as intl;

class ShiftCard extends StatelessWidget {
  final Shift shift;
  final VoidCallback? onTap;

  const ShiftCard({super.key, required this.shift, this.onTap});

  Color _getStatusColor(ShiftStatus status) {
    switch (status) {
      case ShiftStatus.active:
        return Colors.green;
      case ShiftStatus.upcoming:
        return Colors.blue;
      case ShiftStatus.emergency:
        return Colors.red;
      case ShiftStatus.completed:
        return Colors.grey;
    }
  }

  String _getStatusText(ShiftStatus status) {
    switch (status) {
      case ShiftStatus.active:
        return 'فعال';
      case ShiftStatus.upcoming:
        return 'آینده';
      case ShiftStatus.emergency:
        return 'اضطراری';
      case ShiftStatus.completed:
        return 'تکمیل شده';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = intl.DateFormat('yyyy/MM/dd HH:mm'); // Simplified for demo

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(shift.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _getStatusColor(shift.status)),
                    ),
                    child: Text(
                      _getStatusText(shift.status),
                      style: TextStyle(
                        color: _getStatusColor(shift.status),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    shift.role,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                shift.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      shift.location,
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${dateFormat.format(shift.startTime)} - ${dateFormat.format(shift.endTime)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
