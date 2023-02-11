// import 'package:flutter/material.dart';
//
// import '../../../widgets/custom_button_widget.dart';
//
// Future<void> _dialogBuilder(BuildContext context) {
//   return showDialog<void>(
//     useSafeArea: true,
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         scrollable: true,
//         titlePadding: const EdgeInsets.all(0.0),
//         contentPadding:
//             const EdgeInsets.only(top: 0.0, right: 15.0, left: 15.0),
//         actionsPadding: const EdgeInsets.only(bottom: 20.0),
//         backgroundColor: Theme.of(context).cardColor,
//         // title: const Text('Basic dialog title'),
//         content: SizedBox(
//           height: 400.0,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 50,
//                         child: TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               "X",
//                               style: Theme.of(context).textTheme.headline1,
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 60,
//                       ),
//                     ],
//                   ),
//                   const Expanded(child: SizedBox()),
//                   Container(
//                     height: 130.0,
//                     width: 110.0,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       borderRadius: const BorderRadius.only(
//                           topLeft: Radius.zero,
//                           topRight: Radius.zero,
//                           bottomLeft: Radius.circular(25.0),
//                           bottomRight: Radius.circular(25.0)),
//                     ),
//                     child: Column(
//                       children: [
//                         const Expanded(
//                             child: SizedBox(
//                           height: 10.0,
//                         )),
//                         Text(
//                           "فقط بسعر",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(fontSize: 12),
//                         ),
//                         Text(
//                           "١٠٠ ريال",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(fontSize: 22),
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Expanded(child: SizedBox()),
//                   const SizedBox(
//                     width: 50.0,
//                   )
//                 ],
//               ),
//               Text(
//                 'تخفيض أسعار الأسنان و المعالجات',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(fontSize: 18.0),
//               ),
//               Text(
//                 'لمدة شهر بنسبة ٨٠٪',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(fontSize: 28.0, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'تلبيسة ألماني',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 15),
//                     ),
//                     const Expanded(child: SizedBox(width: 1.0)),
//                     Text(
//                       '٩٩ ريال',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'سحب عصب',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 15),
//                     ),
//                     const Expanded(child: SizedBox(width: 1.0)),
//                     Text(
//                       '٢٠٠ ريال',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'حشوة تجميلية',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 15),
//                     ),
//                     const Expanded(child: SizedBox(width: 1.0)),
//                     Text(
//                       '٧٥ ريال',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
//                 height: 1,
//                 width: double.maxFinite,
//                 color: Theme.of(context).primaryColor,
//               ),
//               Text(
//                 'أيضا سحب نهاية الشهر على',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '٥',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 10.0),
//                     Text(
//                       'تقويم أسنان مجاني',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '٥',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 10.0),
//                     Text(
//                       'إبتسامة 3D مجانية',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '0',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 10.0),
//                     Text(
//                       'كوبون شراء مجاني',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MyCustomButton(
//                   customWidget: Text(
//                     "اشترك الأن",
//                     style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                   height: 40.0,
//                   width: 110.0,
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: 15.0,
//                   function: () async {
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
