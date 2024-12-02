import 'package:flutter/material.dart';
import 'package:doctorappointment_v3/presentation/screens/home_screen.dart';

void main() => runApp(DoctorAppointmentApp());

class DoctorAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
