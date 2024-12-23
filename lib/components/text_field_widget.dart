import 'package:gym_workout/utils/export_all.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final int? maxLength;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.readOnly = false,
      this.hintText,
      this.maxLength,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLength: maxLength,
      readOnly: readOnly,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        counterText: "",
        hintStyle: AppTextStyle.textFieldLabelStyle,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: AppTexts.themeText(title: labelText),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
