class Shift {
  final String id;
  final String title;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final String role; // e.g., 'Medic', 'Driver', 'Rescuer'
  final ShiftStatus status;

  Shift({
    required this.id,
    required this.title,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.role,
    required this.status,
  });
}

enum ShiftStatus {
  upcoming,
  active,
  completed,
  emergency
}

// Mock Data for demonstration
final List<Shift> mockShifts = [
  Shift(
    id: '1',
    title: 'پایگاه امداد جاده‌ای - منطقه ۱',
    location: 'کیلومتر ۲۰ جاده قدیم',
    startTime: DateTime.now().add(const Duration(hours: 1)),
    endTime: DateTime.now().add(const Duration(hours: 9)),
    role: 'راننده آمبولانس',
    status: ShiftStatus.active,
  ),
  Shift(
    id: '2',
    title: 'شیفت شب - مرکز فرماندهی',
    location: 'مرکز استان',
    startTime: DateTime.now().add(const Duration(days: 1, hours: 20)),
    endTime: DateTime.now().add(const Duration(days: 2, hours: 8)),
    role: 'اپراتور بیسیم',
    status: ShiftStatus.upcoming,
  ),
  Shift(
    id: '3',
    title: 'عملیات جستجو و نجات',
    location: 'منطقه کوهستانی شمال',
    startTime: DateTime.now().subtract(const Duration(days: 2)),
    endTime: DateTime.now().subtract(const Duration(days: 2, hours: 8)),
    role: 'امدادگر کوهستان',
    status: ShiftStatus.completed,
  ),
];
