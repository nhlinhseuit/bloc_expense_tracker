import 'dart:io';

import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/screens/base/app_wrapper.dart';
import 'package:bloc_expenses_tracker/screens/login/login_bloc/login_bloc.dart';
import 'package:bloc_expenses_tracker/screens/login/views/login_only_email_page.dart';
import 'package:bloc_expenses_tracker/screens/signup/signup_bloc/signup_bloc.dart';
import 'package:bloc_expenses_tracker/screens/signup/views/signup_page.dart';
import 'package:bloc_expenses_tracker/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppUtils.onWillPop(context),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AppWrapper(child: MyAppView()),
              ),
            );

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
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back icon
                        GestureDetector(
                          onTap: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop(); // hoặc exit(0)
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
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
                          "Welcome back! Glad\nto see you, Again!",
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

                        const SizedBox(height: 16),

                        TextField(
                          controller: _passwordController,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              iconSize: 18,
                              color: Colors.grey.shade600,
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                AppUtils.showSnackbar(
                                    context, 'Vui lòng nhập đầy đủ thông tin');
                                return;
                              }

                              context
                                  .read<LoginBloc>()
                                  .add(LoginWithEmailPassword(email, password));
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

                        const SizedBox(height: 24),

                        // Or login with
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: Colors.grey,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Or Login with",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            const Expanded(
                                child: Divider(
                              color: Colors.grey,
                            )),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Social buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(
                              FontAwesomeIcons.facebookF,
                              const Color(0xFF1877F2),
                              LoginMethod.facebook,
                            ), // Facebook blue
                            const SizedBox(width: 16),
                            _socialButton(
                              FontAwesomeIcons.google,
                              const Color(0xFFDB4437),
                              LoginMethod.google,
                            ), // Google red
                            const SizedBox(width: 16),
                            _socialButton(
                              FontAwesomeIcons.phone,
                              Colors.blue,
                              LoginMethod.phone,
                            ), // Apple black
                          ],
                        ),

                        const SizedBox(height: 16),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPageOnlyEmail()),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Login without password",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  // Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (_) =>
                                    SignupBloc(), // 👈 tạo bloc mới mỗi lần mở trang đăng ký
                                child: const SignupPage(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            color: Color(0xFF18C4C7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSigninMethod(LoginMethod loginMethod) {
    switch (loginMethod) {
      case LoginMethod.facebook:
        context.read<LoginBloc>().add(LoginWithFacebook());
        break;
      case LoginMethod.google:
        context.read<LoginBloc>().add(LoginWithGoogle());
        break;
      case LoginMethod.phone:
        // handle phone login
        break;
      case LoginMethod.emailPassword:
        break;
      case LoginMethod.onlyPassword:
        break;
    }
  }

  Widget _socialButton(
      IconData icon, Color iconColor, LoginMethod loginMethod) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _handleSigninMethod(loginMethod);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: FaIcon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
