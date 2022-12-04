import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../../../core/core.dart";

class TextInputField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextInputType inputType;
  final bool obscureText;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool enabled;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter> inputFormatters;
  final String? errorText;
  final FocusNode? focusNode;
  final Widget? multiLineIcon;
  final int? maxLength;

  const TextInputField({
    required this.inputType,
    required this.inputFormatters,
    this.label,
    this.hint = "",
    this.obscureText = false,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.initialValue,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.controller,
    this.enabled = true,
    this.suffix,
    this.prefix,
    this.errorText,
    this.focusNode,
    this.multiLineIcon,
    this.maxLength,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryLightColor.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
          autofocus: autofocus,
          autocorrect: false,
          keyboardType: inputType,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
          initialValue: initialValue,
          maxLines: maxLines,
          onSaved: onSaved,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          validator: validator,
          enabled: enabled,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
          decoration: InputDecoration(
            prefixIcon: prefix,
            errorText: errorText,
            labelText: label,
            hintText: hint,
            counter: maxLength != null
                ? Text.rich(
                    TextSpan(
                      text: controller!.text.length.toString(),
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "  / $maxLength",
                          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: AppTheme.primaryLightColor),
                        ),
                      ],
                    ),
                  )
                : null,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            hintStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
              fontWeight: FontWeight.w300,
            ),
            errorStyle: const TextStyle(
              color: AppTheme.secondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
            border: InputBorder.none,
            // OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.0),
            //   borderSide: const BorderSide(color: AppTheme.primaryLightColor),
            // ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            suffix: multiLineIcon,
            suffixIcon: multiLineIcon != null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: suffix,
                  ),
            counterStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          inputFormatters: inputFormatters,
          focusNode: focusNode,
        ),
      );
}
