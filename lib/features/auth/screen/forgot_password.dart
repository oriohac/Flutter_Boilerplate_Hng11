import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  void _handleSend() {
    final email = _emailController.text;
    // Validate email format
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
      });
      return;
    }

    // Simulate email check
    if (email == 'test@example.com') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerificationScreen(email: email)),
      );
    } else {
      setState(() {
        _errorMessage = 'This email doesn\'t match our records, please try again';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 16.sp),
            const Text('Enter your email'),
            SizedBox(height: 16.sp),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: _errorMessage,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.sp),
            CustomButton(
                onTap: () {},
                borderColor: GlobalColors.borderColor,
                text: "Send",
                height: 48.h,
                containerColor: GlobalColors.orange,
                width: 342.w,
                textColor: Colors.white),
             SizedBox(height: 23.5.sp),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Remember your password? ',
                  style: TextStyle(color: GlobalColors.darkOne),
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: GlobalColors.orange,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // :TODO add function to go login page
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
