import 'dart:async';

import 'package:florence_realtime_observation_gallery/module.dart';
import 'package:florence_realtime_observation_gallery/ui/map_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      ref.read(userControllerProvider.notifier).getUsers();
      ref.read(shiftsControllerProvider).get();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final users = ref.watch(userControllerProvider).map((e) => e.toMarker()).toList();
      final shifts = ref.watch(shiftsControllerProvider).shifts.map((e) => e.toMarker()).toList();
      final ukShifts = ref.watch(ukShiftsControllerProvider).shifts.map((e) => e.toMarker()).toList();
      final ukUsers = ref.watch(ukUserControllerProvider).map((e) => e.toMarker()).toList();

      return Stack(
        children: [
          MapContainer(
            users: [...users, ...ukUsers],
            shifts: [...shifts, ...ukShifts],
          ),
          Row(
            children: [Text("Text")],
          ),
        ],
      );
    });
  }
}
