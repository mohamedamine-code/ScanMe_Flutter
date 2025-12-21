import 'package:flutter/material.dart';
import 'package:scan_me/theme/app_spacing.dart';

class MyTextFlied extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final IconData? prefixIcon;
  final int maxLines;
  final String? errorText;
  final Function(String)? onChanged;

  const MyTextFlied({
    super.key,
    required this.labelText,
    required this.controller,
    this.hintText,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.maxLines = 1,
    this.errorText,
    this.onChanged,
  });

  @override
  State<MyTextFlied> createState() => _MyTextFliedState();
}

class _MyTextFliedState extends State<MyTextFlied> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            color: isDark
                ? Colors.grey.shade900.withOpacity(0.5)
                : Colors.grey.shade50,
            border: Border.all(
              color: isError
                  ? Colors.red.shade400
                  : _isFocused
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
              width: _isFocused ? 2 : 1.5,
            ),
            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.inputType,
            obscureText: widget.obscureText,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            style: TextStyle(
              fontSize: AppSpacing.fontMd,
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: _isFocused
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade600,
                    )
                  : null,
              labelStyle: TextStyle(
                color: _isFocused
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade600,
                fontSize: AppSpacing.fontSm,
                fontWeight: FontWeight.w500,
              ),
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: AppSpacing.fontMd,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              isDense: true,
            ),
          ),
        ),
        if (isError)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm, left: AppSpacing.sm),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Colors.red.shade400,
                fontSize: AppSpacing.fontSm,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
