import 'package:flutter/material.dart';

import '../domain/shifts.dart';
import '../domain/shifts_repository.dart';

class ShiftsController extends ChangeNotifier {
  List<Shift> _shifts = [];

  List<Shift> get shifts => _shifts;
  final ShiftsRepository _shiftsRepository;

  ShiftsController(this._shiftsRepository) {
    // get();
  }

  Future<void> get() async {
    _shifts = [];
    notifyListeners();
    final response = await _shiftsRepository.getShifts();
    _shifts = response.postedShifts;
    notifyListeners();
  }
}
