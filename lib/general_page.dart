import 'package:bloc_expenses_tracker/screens/expense_app/home_expense/get_expenses_blocs/bloc/get_expenses_bloc.dart';
import 'package:bloc_expenses_tracker/screens/expense_app/home_expense/views/home_screen.dart';
import 'package:bloc_expenses_tracker/screens/record_note_app/home_record_note/views/home_screen.dart';
import 'package:bloc_expenses_tracker/widgets/gradient_card.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import thêm để dùng SystemChrome

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'My Application',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HomeScreenRecordNote(),
            //       ),
            //     );
            //   },
            //   child: const GradientCard(
            //     imagePath: 'assets/voice-recorder.svg',
            //     subtitle:
            //         'Take notes conviniently with your voice - with auto transcript powered by OpenAI',
            //     title: 'Record note',
            //     colors: [
            //       Color(0xFF9C27B0), // Màu tím hồng
            //       Color(0xFF2196F3), // Màu xanh dương
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 10),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BlocProvider(
            //           create: (context) =>
            //               GetExpensesBloc(FirebaseExpenseRepo())
            //                 ..add(GetExpenses()),
            //           child: const HomeScreenExpense(),
            //         ),
            //       ),
            //     );
            //   },
            //   child: const GradientCard(
            //     colors: [
            //       Color(0xFFFFA726),
            //       Color(0xFFFFD54F),
            //     ],
            //     imagePath: 'assets/voice-recorder.svg',
            //     subtitle: 'Record your daily expense with easy tracker',
            //     title: 'Expense tracker',
            //   ),
            // )
          ],
        ),
      ),
    ));
  }
}
