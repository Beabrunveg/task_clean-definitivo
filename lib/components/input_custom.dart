import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class InputCustom extends StatefulWidget {
  const InputCustom({
    required this.controller,
    required this.label,
    required this.hint,
    this.isEnabled = true,
    this.obscureText = false,
    this.formatters,
    super.key,
  });
  final bool? obscureText;
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isEnabled;
  final List<TextInputFormatter>? formatters;

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  bool showPass = false;
  void showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Text(
            widget.label,
            style: TextStyleApp.caption,
          ),
        gap4,
        TextFormField(
          enabled: widget.isEnabled,
          controller: widget.controller,
          obscureText: widget.obscureText == true ? !showPass : false,
          inputFormatters: widget.formatters,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText!
                ? InkWell(
                    onTap: showPassword,
                    child: !showPass
                        ? const Icon(
                            Icons.visibility,
                            size: 20,
                            color: AppColors.blue50,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: AppColors.blue50,
                          ),
                  )
                : null,
            contentPadding: padSy8,
            hintText: widget.hint,
            hintStyle: TextStyleApp.body.gray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.gray50,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.gray50,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.gray50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}