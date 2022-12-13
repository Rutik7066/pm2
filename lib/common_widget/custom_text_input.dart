import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    Key? key,
    this.validator,
    required this.labelText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.autovalidateMode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
    this.obscureText,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.onTap,
  }) : super(key: key);
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      minLines: minLines,
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        hintText: labelText,
        enabled: enabled,
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), gapPadding: 0, borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 5,
        ),
      ),
      style: Theme.of(context).textTheme.labelLarge,
      cursorColor: Colors.grey.shade400,
    );
  }
}

class CDropDownButtonFormField extends StatelessWidget {
  const CDropDownButtonFormField({Key? key, required this.hintText, this.onSaved, this.items, this.icon, this.value, required this.onChanged}) : super(key: key);
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final String hintText;
  final Widget? icon;
  final dynamic value;
  final void Function(dynamic)? onSaved;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text(
        hintText,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
      ),
      value: value,
      onChanged: onChanged,
      onSaved: onSaved,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        isDense: true,
        border: OutlineInputBorder(gapPadding: 0, borderSide: BorderSide(width: 0.5)),
        contentPadding: EdgeInsets.symmetric(
          vertical: 9.5,
          horizontal: 10,
        ),
      ),
      items: items,
    );
  }
}

class CustomAutoCompleteTextFormField extends StatelessWidget {
  const CustomAutoCompleteTextFormField({
    Key? key,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    required this.suggestionsCallback,
    required this.label,
    this.suffixIcon,
    this.controller,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final void Function(dynamic) onSuggestionSelected;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final FutureOr<Iterable<dynamic>> Function(String) suggestionsCallback;
  final String label;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      minCharsForSuggestions: 1,
      validator: validator,
      hideOnEmpty: true,
      hideOnError: true,
      hideOnLoading: true,
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          isDense: true,
          alignLabelWithHint: true,
          filled: true,
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), gapPadding: 0, borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 5,
          ),
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.labelLarge,
        cursorColor: Colors.grey.shade400,
      ),
      onSuggestionSelected: onSuggestionSelected,
      itemBuilder: itemBuilder,
      suggestionsCallback: suggestionsCallback,
      onSaved: onSaved,
    );
  }
}
