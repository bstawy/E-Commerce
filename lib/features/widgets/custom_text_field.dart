import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final bool? enabled;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.value,
      autofocus: false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: 1,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType ?? TextInputType.text,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.primaryColor,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: "Poppins",
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        // suffix: isPass widget.suffixWidget,
        contentPadding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorMaxLines: 4,
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}
