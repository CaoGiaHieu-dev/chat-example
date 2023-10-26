import 'package:flutter/widgets.dart';

import '../widgets/commons/custom_input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomInputField(controller: TextEditingController()),
    );
  }
}
