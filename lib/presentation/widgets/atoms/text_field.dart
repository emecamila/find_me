part of 'atoms.dart';

class FMTextField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final TextEditingController? controller;
  final Color borderColor;
  final Color? background;
  final Color focusedBorderColor;
  final Color errorColor;
  final Color labelColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextAlign? textAlign;
  final int? maxLength;
  final int maxLines;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final BorderRadius borderRadius;
  final VoidCallback? onTapTextField;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final TextInputType? keyBoardType;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool isObscureText;
  final bool readOnly;
  final TextCapitalization textCapitalization;

  FMTextField({
    this.controller,
    this.label,
    this.readOnly = false,
    this.borderColor = Colors.transparent,
    this.background,
    this.focusedBorderColor = Colors.black,
    this.errorColor = Colors.red,
    this.labelColor = FMColors.grey800,
    this.suffixIconColor,
    this.onTapTextField,
    this.prefixIconColor = FMColors.grey800,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines = 1,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.onChanged,
    this.validator,
    double borderRadius = Layout.space16,
    this.autofocus = false,
    this.keyBoardType,
    this.focusNode,
    this.textStyle,
    this.isObscureText = false,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.errorText,
    super.key,
  }) : borderRadius = BorderRadius.all(
          Radius.circular(borderRadius),
        );

  @override
  Widget build(BuildContext context) => TextFormField(
        textCapitalization: textCapitalization,
        onTap: onTapTextField,
        obscuringCharacter: '●',
        readOnly: readOnly,
        obscureText: isObscureText,
        style: textStyle,
        focusNode: focusNode,
        validator: validator,
        maxLength: maxLength,
        controller: controller,
        textAlign: textAlign!,
        onChanged: onChanged,
        autofocus: autofocus!,
        keyboardType: keyBoardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor:
              background ?? (readOnly ? Colors.grey.shade200 : Colors.white),
          filled: true,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: FMPadding.paddingH8,
                  child: IconButton(
                    onPressed: onTapSuffixIcon,
                    icon: Icon(
                      suffixIcon,
                      color: suffixIconColor,
                    ),
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: FMPadding.paddingH8,
                  child: IconButton(
                    onPressed: onTapPrefixIcon,
                    icon: Icon(
                      prefixIcon,
                      color: prefixIconColor,
                    ),
                  ),
                )
              : null,
          errorText: errorText,
          counterText: kEmptyString,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: labelStyle ??
              TextStyle(
                color: labelColor,
              ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: readOnly ? Colors.grey : focusedBorderColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: errorColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: errorColor,
            ),
          ),
          errorStyle: TypoBody.size14.copyWith(
            color: errorColor,
          ),
        ),
      );
}
