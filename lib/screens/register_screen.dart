import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/extensions/context_extension.dart';
import '../core/utilities/validator/validator.dart';
import '../providers/register_provider.dart';
import '../router/app_routes.dart';
import '../widgets/commons/custom_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          style: context.headlineMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Form(
                          key: context.read<RegisterProvider>().key,
                          child: Column(
                            children: [
                              CustomInputField(
                                controller: context
                                    .read<RegisterProvider>()
                                    .emailController,
                                title: 'email',
                                validator: (value) {
                                  if (value == null ||
                                      !EmailValidatorModel.validate(value)) {
                                    return "Invalid Email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 5.h),
                              CustomInputField(
                                isPassword: true,
                                controller: context
                                    .read<RegisterProvider>()
                                    .passController,
                                title: 'password',
                                validator: Validator.validateAll([
                                  NotEmpty('Cannot empty'),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<RegisterProvider>().register(context);
                          },
                          color: Colors.blue.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Register',
                            style: context.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            const LoginRoute().go(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Login',
                            style: context.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
