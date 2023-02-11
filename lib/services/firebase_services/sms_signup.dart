// import 'package:basic_project/screens/authentication/models/models_export.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../generated/l10n.dart';
// import '../helper/helper_export.dart';
// import '../widgets/widgets_export.dart';
//
// String otpPin = " ";
// String verID = " ";
//
// /// Part 1 of 3  SignUp by phone number send sms Firebase
// Future<void> verifyPhone(
//     BuildContext context, CustomUserInfo customUserInfo) async {
//   printLog(stateID: '422983', data: 'Start send massage', isSuccess: true);
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: customUserInfo.phoneNumber,
//     timeout: const Duration(seconds: 120),
//     verificationCompleted: (PhoneAuthCredential credential) {
//       myCustomShowSnackBarText(context, "Auth Completed");
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       myCustomKillLoadingDialog(context);
//       myCustomShowSnackBarText(context, "Auth Failed!");
//       printLog(stateID: '420104', data: e.toString(), isSuccess: false);
//     },
//     codeSent: (String verificationId, int? resendToken) async {
//       myCustomShowSnackBarText(context, "OTP Sent");
//       verID = verificationId;
//       await showDialog(
//         context: context,
//         useSafeArea: false,
//         builder: (_) => ListView(
//           padding: const EdgeInsets.symmetric(vertical: 70.0),
//           children: [
//             AlertDialog(
//               // backgroundColor: yellowColor,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
//               insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
//               // title: Text((state.errorTitle.toString())),
//               content: stateOTP(context, customUserInfo),
//               // backgroundColor: Colors.red,
//               elevation: 24,
//             ),
//           ],
//         ),
//       );
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       myCustomKillLoadingDialog(context);
//       myCustomShowSnackBarText(context, "Timeout!");
//     },
//   );
// }
//
// /// Part 2 of 3SignUp by phone number send sms Firebase
// Widget stateOTP(BuildContext context, CustomUserInfo customUserInfo) {
//   return Container(
//     height: 500.0,
//     // width: double.maxFinite,
//     color: Theme.of(context).cardColor,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         Image.asset('assets/images/pass.jpg'),
//         const SizedBox(
//           height: 10,
//         ),
//         RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             style: const TextStyle(color: Colors.blue),
//             children: [
//               TextSpan(
//                 text: S.of(context).confirm_code,
//               ),
//               TextSpan(
//                 text: "\n${customUserInfo.phoneNumber}",
//               ),
//               TextSpan(
//                 text: '\n${S.of(context).enter_confirm_code}',
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 5),
//         PinCodeTextField(
//           appContext: context,
//           length: 6,
//           onChanged: (value) {
//             otpPin = value;
//           },
//         ),
//         const SizedBox(height: 10),
//         GestureDetector(
//           onTap: () async {
//             await verifyOTP(customUserInfo);
//           },
//           child: Container(
//               alignment: Alignment.center,
//               height: 40.0,
//               width: 100.0,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(7.0),
//               ),
//               child: Text(
//                 S.of(context).next,
//                 style: const TextStyle(color: Colors.yellowAccent),
//               )),
//         ),
//         const SizedBox(height: 10.0),
//         RichText(
//           text: TextSpan(
//             children: [
//               WidgetSpan(
//                 child: GestureDetector(
//                   onTap: () {
//                     myCustomKillLoadingDialog(context);
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     S.of(context).resend_confirm_code,
//                     style: const TextStyle(color: Colors.yellow),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         RichText(
//           textAlign: TextAlign.center,
//           text: const TextSpan(
//             style: TextStyle(color: Colors.blue),
//             children: [
//               TextSpan(
//                 text: "${"S.current.pCC"}\n",
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// /// Part 3 of 3 SignUp by phone number send sms Firebase
// Future<void> verifyOTP(CustomUserInfo customUserInfo) async {
//   await FirebaseAuth.instance
//       .signInWithCredential(
//     PhoneAuthProvider.credential(
//       verificationId: verID,
//       smsCode: otpPin,
//     ),
//   )
//       .then((value) async {
//     // myCustomKillLoadingDialog(context);
//     // context.read<AuthBloc>().add(AuthSignInEven(
//     //       phoneNumber: phoneNumber,
//     //       userEmailEvent: email,
//     //       passwordEvent: password,
//     //       displayName: userName,
//     //       tokenFCM: await getDeviceToken(false),
//     //       isSignIn: false,
//     //       autoSignIn: false,
//     //     ));
//     printLog(stateID: "502918", data: "done SignUp", isSuccess: true);
//   }).whenComplete(() {});
// }
