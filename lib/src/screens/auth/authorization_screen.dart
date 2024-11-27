import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_elevated_button.dart';
import 'package:gap/gap.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  bool get _isButtonEnabled {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    'Почта',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'example123@mail.com',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              const Gap(12),
              const Row(
                children: [
                  Text(
                    'Пароль',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ваш пароль',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              const Gap(24),
              PrimaryElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  Navigator.pushNamed(context, '/');
                }
                    : null,
                child: const Text('Подтвердить'),
              ),
              Gap(12),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(.5),
                  ),
                  children: [
                    const TextSpan(
                      text: 'Нет аккаунта? ',
                    ),
                    TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      text: 'Регистрация',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/registration');
                        },
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Я согласен на ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          TextSpan(
                            text: 'обработку персональных данных ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'и с ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          TextSpan(
                            text: 'правилами пользовательского соглашения',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
