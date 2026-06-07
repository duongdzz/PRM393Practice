import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool _isCheckingEmail = false;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  // ==========================
  // Validators
  // ==========================

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least 1 digit';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != _password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // ==========================
  // Fake API
  // ==========================

  Future<bool> checkEmailAvailability(String email) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.toLowerCase().startsWith('taken')) {
      return false;
    }

    return true;
  }

  // ==========================
  // Submit
  // ==========================

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isCheckingEmail = true;
    });

    bool available = await checkEmailAvailability(_email);

    setState(() {
      _isCheckingEmail = false;
    });

    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This email is already taken'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Signup successful! Welcome $_name',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup Form'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                const Icon(
                  Icons.person_add,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // =====================
                // Full Name
                // =====================

                TextFormField(
                  focusNode: _nameFocus,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: validateName,
                  onSaved: (value) {
                    _name = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_emailFocus);
                  },
                ),

                const SizedBox(height: 16),

                // =====================
                // Email
                // =====================

                TextFormField(
                  focusNode: _emailFocus,
                  keyboardType:
                  TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: validateEmail,
                  onSaved: (value) {
                    _email = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_passwordFocus);
                  },
                ),

                const SizedBox(height: 16),

                // =====================
                // Password
                // =====================

                TextFormField(
                  focusNode: _passwordFocus,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon:
                    const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                          !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: validatePassword,
                  onChanged: (value) {
                    _password = value;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_confirmFocus);
                  },
                ),

                const SizedBox(height: 16),

                // =====================
                // Confirm Password
                // =====================

                TextFormField(
                  focusNode: _confirmFocus,
                  obscureText:
                  _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: const OutlineInputBorder(),
                    prefixIcon:
                    const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator:
                  validateConfirmPassword,
                  onSaved: (value) {
                    _confirmPassword = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    _submit();
                  },
                ),

                const SizedBox(height: 30),

                // =====================
                // Submit Button
                // =====================

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed:
                    _isCheckingEmail
                        ? null
                        : _submit,
                    child:
                    _isCheckingEmail
                        ? const SizedBox(
                      width: 24,
                      height: 24,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    )
                        : const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
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