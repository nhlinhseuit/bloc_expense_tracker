// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class GradientCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final List<Color> colors;

//   const GradientCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//     required this.colors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxHeight: 120),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: colors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 4,
//               color: Colors.grey.shade300,
//               offset: const Offset(3, 3),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(16),
//         width: double.infinity,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     subtitle,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white70,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Image section
//             SvgPicture.asset(
//               imagePath,
//               width: 80,
//               height: 80,
//               fit: BoxFit.contain,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
