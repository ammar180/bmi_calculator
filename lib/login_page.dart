import 'package:bmi_calculator/bmi_page.dart';
import 'package:bmi_calculator/componants/my_textfield.dart';
import 'package:bmi_calculator/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.55IGwIn2JO7O4RazfVvGwAHaDg?rs=1&pid=ImgDetMain'),
                      width: 200,
                      height: 100,
                    ),
                    MyTextfield(
                        hintText: "Email", controller: TextEditingController()),
                    const SizedBox(height: 10),
                    MyTextfield(
                      hintText: "Password",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 10),
                    const Text("Forget Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BmiPage(title: "BIM"))),
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New User? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignupPage(title: "Sign UP Page")));
                        },
                        child: const Text("Create Account"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
