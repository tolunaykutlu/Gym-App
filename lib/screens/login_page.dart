import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffE2E2E2),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            spaceSmall(),
            const Center(
                child: Image(image: AssetImage("images/GymPoint.png"))),
            spaceSmall(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CHANGE ",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "30",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            spaceSmall(),
            spaceSmall(),
            Text(
              "Sign In",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            spaceSmall(),
            CustomTextField(
              control: controller,
              hintText: "Phone/E-mail",
            ),
            spaceSmall(),
            CustomTextField(
              control: passwordController,
              hintText: "Password",
              secret: true,
              sufIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.lock_open),
              ),
            ),
            spaceSmall(),
            SizedBox(
              width: size.width,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color(0xffF54242)),
                child: const Text("Sign In"),
              ),
            ),
            spaceSmall(),
            const Text("Forgot Password?"),
            spaceLarge(),
            spaceSmall(),
            Text(
              "Sign in With",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            spaceSmall(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Icon(Icons.facebook),
                ),
                Icon(Icons.g_mobiledata)
              ],
            ),
            spaceMedium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account?"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox spaceSmall() {
    return const SizedBox(
      height: 15,
    );
  }

  SizedBox spaceMedium() {
    return const SizedBox(
      height: 25,
    );
  }

  SizedBox spaceLarge() {
    return const SizedBox(
      height: 35,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final String hintText;
  final bool secret;
  final Widget? sufIcon;

  const CustomTextField({
    super.key,
    required this.control,
    required this.hintText,
    this.secret = false,
    this.sufIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: control,
        obscureText: secret,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: sufIcon,
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))));
  }
}
