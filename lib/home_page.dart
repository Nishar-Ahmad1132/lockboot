// import 'package:flutter/material.dart';
// // import 'package:firebase_database/firebase_database.dart';

// int currentIndex = 0;

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//   // final DatabaseReference _database = FirebaseDatabase.instance.ref();

//   // void _toggleLock(bool locked) {
//   //   int lockValue = locked ? 1 : 0;
//   //   _database.child('doorLock').set(lockValue);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //       label: 'Settings',
//       //       icon: Icon(Icons.settings),
//       //     ),
//       //     BottomNavigationBarItem(
//       //       label: 'Home',
//       //       icon: Icon(Icons.home),
//       //     ),
//       //     BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
//       //   ],
//       //   backgroundColor: const Color.fromARGB(0, 190, 7, 7),
//       //   currentIndex: currentIndex,
//       //   onTap: (int index) {
//       //     setState(() {
//       //       currentIndex = index;
//       //     });
//       //   },
//       // ),
//       appBar: AppBar(
//         title: const Text(
//           'Welcome to your Home',
//           style: TextStyle(
//             backgroundColor: Colors.transparent,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//             color: Color.fromARGB(255, 12, 11, 11),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/lockboot.jpg'),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: const Center(
//           child: LockUnlockButton(),
//         ),
//       ),
//     );
//   }
// }

// class LockUnlockButton extends StatefulWidget {
//   const LockUnlockButton({super.key});

//   @override
//   State<LockUnlockButton> createState() {
//     return _LockUnlockButtonState();
//   }
// }

// class _LockUnlockButtonState extends State<LockUnlockButton> {
//   bool _locked = true;

//   void _toggleLock() {
//     setState(() {
//       _locked = !_locked;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String message = _locked ? 'Door is unlocked ' : 'Door is locked';
//     return Container(
//       // decoration: const BoxDecoration(
//       //   image: DecorationImage(
//       //     image: AssetImage('assets/signup.jpg'),
//       //     fit: BoxFit.cover,
//       //   ),
//       // ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _toggleLock();
//             },
//             style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 side: const BorderSide(color: Colors.blueGrey, width: 2),
//                 padding: const EdgeInsets.all(35)),
//             child: Text(
//               _locked ? 'Lock' : 'Unlock',
//               style: const TextStyle(fontSize: 32, color: Colors.white),
//             ),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           const Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Your Current status is : ',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 7, 239, 30),
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Text(
//             message,
//             style: const TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.normal,
//               color: Color.fromARGB(255, 16, 13, 13),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
