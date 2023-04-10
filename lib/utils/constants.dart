import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final format = NumberFormat.currency(name: '');
DateFormat dateFormat = DateFormat("E, MMM d, y").add_jm();
DateFormat justDate = DateFormat("MMM d, y");
DateFormat justTime = DateFormat().add_jm();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
