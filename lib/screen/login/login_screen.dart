import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
              Container(
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
                      // suffixIcon: IconButton(
                      //     icon: Icon(
                      //       isObscure
                      //           ? Icons.visibility
                      //           : Icons.visibility_off,
                      //       color: ColorsConstant.APP_PRIMARY_COLOR,
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         isObscure = !isObscure;
                      //       });
                      //     }),
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
              Container(
                width: 450,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.REGISTER_PAGE);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.REGISTER_PAGE);
                  },
                  child: const Text(
                    "Do not have an account ? Signup here.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
