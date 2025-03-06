import 'package:bloc_expenses_tracker/screens/record_note_app/list_record_note/list_record_screen.dart';
import 'package:bloc_expenses_tracker/screens/record_note_app/main_record_note/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenRecordNote extends StatefulWidget {
  const HomeScreenRecordNote({super.key});

  @override
  State<HomeScreenRecordNote> createState() => _HomeScreenRecordNoteState();
}

class _HomeScreenRecordNoteState extends State<HomeScreenRecordNote> {
  int index = 0;
  Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? const MainScreenRecordNote() : const ListRecordScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // Bo góc trên
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Đổ bóng nhẹ
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0, // Xóa bóng mặc định để tránh xung đột
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: index == 0 ? selectedItem : unselectedItem,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.graph_square,
                    color: index == 1 ? selectedItem : unselectedItem,
                  ),
                  label: 'Stats',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
