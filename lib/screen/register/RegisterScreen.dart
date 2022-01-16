import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: TextField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: "Enter Your Name ",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      onChanged: (value) {}),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 450,
                  child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: "Enter Your Email ",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      onChanged: (value) {}),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 450,
                  child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: "Enter Password ",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      onChanged: (value) {}),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 450,
                  child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: "Enter  Confirm Password ",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      onChanged: (value) {}),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 450,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
