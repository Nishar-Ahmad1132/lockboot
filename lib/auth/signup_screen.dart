import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lockboot/auth/login_screen.dart';
// import 'package:lockboot/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lockboot/myapp.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final bool _islogin = false;
  var _userEmail = '';
  var _userPassword = '';
  // ignore: unused_field
  var _userName = '';

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    if (_islogin) {
      return;
    } else {
      try {
        await _firebase
            .createUserWithEmailAndPassword(
                email: _userEmail, password: _userPassword)
            .then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPage(),
              ),
            );
          },
        );
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          //...
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication Failed'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lockboot.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFF2A2F4F),
          title: Center(
            child: Text(
              'Sign-Up Page',
              style: GoogleFonts.lato(
                color: const Color(0xFFFFEBF8),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          toolbarHeight: 75,
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 75),
              child: Text(
                'Welcome!\nCreate New Account',
                style: GoogleFonts.lato(
                  color: const Color(0xFF000000),
                  fontSize: 32,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 250, horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Enter correct name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'User-Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (value) {
                            _userName = value.toString();
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Enter correct email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_rounded),
                          ),
                          onSaved: (value) {
                            _userEmail = value.toString();
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Enter min 7 character';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock)),
                          onSaved: (value) {
                            _userPassword = value.toString();
                          },
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                backgroundColor:
                                    const Color(0xFF2A2F4F),
                              ),
                              onPressed: _trySubmit,
                              child: Text(
                                'Sign-Up',
                                style: GoogleFonts.lato(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFEBF8),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Do you have already\nan account?',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 27, 25, 25),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.lato(
                                  fontSize: 22,
                                  color: const Color.fromARGB(255, 102, 40, 36),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
