import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({
    super.key,
    this.onChanged,
    this.onFocus,
    this.onUnFocus,
    this.radius = 5,
    this.width,
    this.maxLines = 1,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.onSuffix,
    this.fillColor,
    this.hintText,
    this.obscureText = false,
    this.translateLabel = true,
    this.disabled = false,
    this.margin,
    this.textCapitalization,
    required this.textController,
  });

  final Function(String value)? onChanged;
  final Function()? onFocus;
  final Function()? onUnFocus;
  final double radius;
  final double? width;
  final int maxLines;
  final int? maxLength;
  final TextInputType textInputType;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? onSuffix;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController textController;
  final bool obscureText;
  final bool translateLabel;
  final bool disabled;
  final EdgeInsets? margin;
  final TextCapitalization? textCapitalization;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  String hintTranslation = '';
  bool isStringEmpty = true;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    hintTranslation = widget.hintText ?? '';
    if (widget.onFocus != null || widget.onUnFocus != null) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          if (widget.onFocus != null) {
            widget.onFocus!();
          }
        } else {
          if (widget.onUnFocus != null) {
            widget.onUnFocus!();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: widget.maxLines == 1 ? 50 : null,
          width: widget.width ?? double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            enabled: !widget.disabled,
            obscureText: widget.obscureText,
            controller: widget.textController,
            keyboardType: widget.maxLines > 1
                ? TextInputType.multiline
                : widget.textInputType,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hintTranslation,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey[500]!),
              fillColor:
                  widget.disabled ? Colors.grey.shade300 : widget.fillColor,
              filled: widget.fillColor == null ? false : true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              isDense: true,
              border: InputBorder.none,
              prefixIcon: widget.prefix != null ? Icon(
                widget.prefix,
                color: isStringEmpty ? Colors.grey[400]! : Colors.black,
              ) : null,
              suffixIcon: widget.suffix != null ? InkWell(
                onTap: widget.onSuffix,
                child: Icon(
                  widget.suffix,
                  color: isStringEmpty ? Colors.grey[400]! : Colors.black,
                ),
              ) : null,
            ),
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            buildCounter: (
              context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) =>
                null,
            onChanged: (String value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
              setState(() {
                isStringEmpty = value.isEmpty;
              });
            },
            focusNode: focusNode,
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
