import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
import 'package:lockboot/details_screen.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  void _toggleLock(bool locked) {
    int lockValue = locked ? 1 : 0;
    _database.child('doorLock').set(lockValue);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Welcome Home',
      home: MyHomePage(toggleLock: _toggleLock),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(bool) toggleLock;

  const MyHomePage({super.key, required this.toggleLock});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DR-Project : lockboot',
          style: GoogleFonts.lato(
            color: const Color(0xFFFFEBF8),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2A2F4F),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Center(
        child: LockUnlockButton(toggleLock: toggleLock),
      ),
    );
  }
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Size preferredSize;

// CustomAppBar({required this.title})
//     : preferredSize = Size.fromHeight(kToolbarHeight);

// @override
// Widget build(BuildContext context) {
//   return AppBar(
//     // title: Text(title),
//     centerTitle: true,
//   );
// }
// }

class LockUnlockButton extends StatefulWidget {
  final Function(bool) toggleLock;

  const LockUnlockButton({super.key, required this.toggleLock});

  @override
  State<LockUnlockButton> createState() => _LockUnlockButtonState();
  // _LockUnlockButtonState createState() => _LockUnlockButtonState();
}

class _LockUnlockButtonState extends State<LockUnlockButton> {
  bool _locked = true;

  void _toggleLock() {
    setState(() {
      _locked = !_locked;
    });
    widget.toggleLock(_locked);
  }

  var _currentIndex = 0;
  final tabs = [
    MyPage(),
    const DetailsScreen(),
  ];
  // ignore: unused_field
  // final List<Widget> _pages = [
  //   MyPage(),
  //   const DetailsScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    String message = _locked ? 'Locked' : 'Unlocked';
    // Size size = MediaQuery.of(context).size;
    // var time = DateTime.now();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lockboot.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              child: Text(
                'Hello, Welcome to your Home',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color(0xFF000000),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your Door is Currently : ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: const Color(0xFF917FB3),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              message,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 27, 25, 25),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _toggleLock();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.blueGrey, width: 2),
                padding: const EdgeInsets.all(35),
                backgroundColor: const Color(0xFF2A2F4F),
              ),
              child: Text(
                _locked ? 'Unlock' : 'Lock',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
          ),
        ],
        fixedColor: const Color(0xFFFFEBF8),
        backgroundColor: const Color(0xFF2A2F4F),
      ),
    );
  }
}
