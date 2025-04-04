import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/screens/base/app_wrapper.dart';
import 'package:bloc_expenses_tracker/screens/login/login_bloc/login_bloc.dart';
import 'package:bloc_expenses_tracker/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageOnlyEmail extends StatefulWidget {
  const LoginPageOnlyEmail({super.key});

  @override
  State<LoginPageOnlyEmail> createState() => _LoginPageOnlyEmailState();
}

class _LoginPageOnlyEmailState extends State<LoginPageOnlyEmail> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginEmailLinkSent) {
          AppUtils.showSnackbar(context,
              'Gửi link verify tới email ${_emailController.text} thành công!');
        } else if (state is LoginSuccess) {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AppWrapper(child: MyAppView()),
          //   ),
          // );

          AppUtils.showSnackbar(context, 'Đăng nhập thành công!');
        } else if (state is LoginFailure) {
          AppUtils.showSnackbar(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white, // Nền trắng
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back icon
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                const Text(
                  "Enter email and verify to login!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // Email field
                TextField(
                  controller: _emailController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFE6E6E6),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFB0B8C1),
                        width: 1.2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text.trim();

                      if (email.isEmpty) {
                        AppUtils.showSnackbar(
                            context, 'Vui lòng nhập đầy đủ thông tin');
                        return;
                      }

                      context.read<LoginBloc>().add(LoginWithOnlyEmail(email));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
