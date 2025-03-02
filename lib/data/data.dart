import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const Icon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
  },
  {
    'icon': const Icon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'color': Colors.purple,
    'name': 'Shopping',
    'totalAmount': '-\$230.00',
    'date': 'Today',
  },
  {
    'icon': const Icon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'color': Colors.green,
    'name': 'Health',
    'totalAmount': '-\$79.00',
    'date': 'Yesterday',
  },
  {
    'icon': const Icon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    'color': Colors.blue,
    'name': 'Travel',
    'totalAmount': '-\$350.00',
    'date': 'Yesterday',
  },
];
