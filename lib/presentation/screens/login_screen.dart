import 'package:flutter/material.dart';
import 'package:green_fin/presentation/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'assets/images/greenfin.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const Spacer(flex: 1),
            const LoginWidget(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
