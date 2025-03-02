// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

// class AddExpense extends StatefulWidget {
//   const AddExpense({super.key});

//   @override
//   State<AddExpense> createState() => _AddExpenseState();
// }

// class _AddExpenseState extends State<AddExpense> {
//   TextEditingController expenseController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   DateTime selectedDate = DateTime.now();

//   @override
//   void initState() {
//     dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.surface,
//         ), // AppBar
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 "Add Expenses",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ), // Text
//               const SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: TextFormField(
//                   controller: expenseController,
//                   textAlignVertical: TextAlignVertical.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(
//                       FontAwesomeIcons.dollarSign,
//                       size: 16,
//                       color: Colors.grey,
//                     ), // Icon
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ), // OutlineInputBorder
//                   ), // InputDecoration
//                 ), // TextFormField
//               ), // SizedBox

//               const SizedBox(height: 22),
//               TextFormField(
//                 controller: categoryController,
//                 readOnly: true,
//                 textAlignVertical: TextAlignVertical.center,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     FontAwesomeIcons.list,
//                     size: 16,
//                     color: Colors.grey,
//                   ), // Icon
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: const Center(
//                                 child: Text(
//                                   'Create a category',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               backgroundColor: const Color(0xFFd5ebf1),
//                               content: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   TextFormField(
//                                     // controller: dateController,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       hintText: 'Name',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide.none,
//                                       ), // OutlineInputBorder
//                                     ), // InputDecoration
//                                   ),
//                                   const SizedBox(height: 16),
//                                   TextFormField(
//                                     // controller: dateController,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       hintText: 'Icon',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide.none,
//                                       ), // OutlineInputBorder
//                                     ), // InputDecoration
//                                   ),
//                                   const SizedBox(height: 16),
//                                   TextFormField(
//                                     // controller: dateController,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       hintText: 'Color',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide.none,
//                                       ), // OutlineInputBorder
//                                     ), // InputDecoration
//                                   ),
//                                 ],
//                               ),
//                             );
//                           });
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.plus,
//                       size: 16,
//                       color: Colors.grey,
//                     ),
//                     color: Colors.grey,
//                   ), // Icon
//                   hintText: 'Category',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ), // OutlineInputBorder
//                 ), // InputDecoration
//               ), //
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: dateController,
//                 textAlignVertical: TextAlignVertical.center,
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? newDate = await showDatePicker(
//                     context: context,
//                     initialDate: selectedDate,
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime.now().add(const Duration(days: 165)),
//                   );

//                   if (newDate != null) {
//                     setState(() {
//                       dateController.text =
//                           DateFormat('dd/MM/yyyy').format(newDate);
//                       selectedDate = newDate;
//                     });
//                   }
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     FontAwesomeIcons.clock,
//                     size: 16,
//                     color: Colors.grey,
//                   ), // Icon
//                   hintText: 'Date',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ), // OutlineInputBorder
//                 ), // InputDecoration
//               ), //
//               const SizedBox(height: 32),
//               SizedBox(
//                 width: double.infinity,
//                 height: kToolbarHeight,
//                 child: TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ), // RoundedRectangleBorder
//                   ),
//                   child: const Text(
//                     'Save',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ), // TextStyle
//                   ), // Text
//                 ), // TextButton
//               ), // SizedBox
//             ],
//           ), // Column
//         ), // Padding
//       ),
//     ); // Scaffold
//   }
// }
