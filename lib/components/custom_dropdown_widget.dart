import 'package:gym_workout/utils/export_all.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? value;
  final String? hintText;
  final List<String> genderOptions;
  final ValueChanged<String?> onChanged;
  const CustomDropdownWidget(
      {super.key,
      this.value,
      required this.genderOptions,
      required this.onChanged,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primaryColor, // Set the border color here
          // width: 2, // Set the border width here
        ),
        borderRadius: BorderRadius.circular(10),
        // Set the border radius here
      ),
      child: DropdownButton<String>(
        icon:
            Icon(Icons.keyboard_arrow_down_sharp, color: AppColor.primaryColor),
        underline: const Text(""),
        isExpanded: true,
        hint: AppTexts.themeText(title: hintText ?? "Select Gender"),

        // Text(hintText ?? "Select Gender",
        //     style: AppTextStyle.textFieldLabelStyle
        //         .copyWith(fontWeight: FontWeight.normal)),
        value: value,
        items: genderOptions.map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: onChanged,
      ).paddingSymmetric(horizontal: 20.w, vertical: 4.h),
    );
  }
}
