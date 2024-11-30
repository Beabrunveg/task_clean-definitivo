import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class InputSearchCustom extends StatefulWidget {
  const InputSearchCustom({
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.isEnabled = true,
    this.obscureText = false,
    super.key,
  });
  final bool? obscureText;
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isEnabled;
  final Function(String)? onChanged;

  @override
  State<InputSearchCustom> createState() => _InputSearchCustomState();
}

class _InputSearchCustomState extends State<InputSearchCustom> {
  bool showPass = false;
  void showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSy32.copyWith(bottom: 0, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            enabled: widget.isEnabled,
            controller: widget.controller,
            obscureText: widget.obscureText == true ? !showPass : false,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.blue100,
              contentPadding: padSy8,
              hintText: widget.hint,
              hintStyle: TextStyleApp.body.blue50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: AppColors.blue50,
                ),
              ),
              suffix: Container(
                padding: padSy2,
                decoration: BoxDecoration(
                  color: AppColors.blue50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.search,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: AppColors.blue50,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: AppColors.blue50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
