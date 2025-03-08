import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final expenses = [
  '',
  '',
  '',
  '',
  '',
];

class ListRecordScreen extends StatelessWidget {
  const ListRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện khi nhấn vào "View All"
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //? TRANSACTION
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('record 1'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
