import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wesbeng/helpers/sp_helper.dart';
import 'package:wesbeng/services/api_service.dart';

import 'package:wesbeng/utils/entrypoint.dart';
import 'package:wesbeng/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_scrollToFocusedField);
    _passwordFocusNode.addListener(_scrollToFocusedField);
  }

  void _scrollToFocusedField() {
    if (_scrollController.hasClients) {
      if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _login(BuildContext context) async {
    setState(() {
      _isFetching = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final email = _emailController.text;
      final password = _passwordController.text;

      final apiService = ApiService();
      final response = await apiService.post(
        'login',
        {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['data']['access_token'];
        await SharedPreferencesHelper.setAccessToken(token);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Entrypoint(),
          ),
          (_) => true,
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("An error occurred"),
          ),
        );
      }
    }

    setState(() {
      _isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: 200,
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  'assets/img/logo.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
              ),
              Text(
                "Log In",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Welcome back! Log in to your account",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        focusColor: Theme.of(context).primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Email is required'),
                        EmailValidator(
                            errorText: 'Enter a valid email address'),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        focusColor: Theme.of(context).primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _obscureText,
                      validator:
                          RequiredValidator(errorText: 'Password is required'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _isFetching
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: () => _login(context),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
