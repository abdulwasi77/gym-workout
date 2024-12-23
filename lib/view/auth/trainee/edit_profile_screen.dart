import 'dart:io';
import 'package:gym_workout/utils/export_all.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(EditProfileScreenController());
    return Scaffold(
      appBar:
          CustomAppBars.primaryAppBar(title: "Edit Profile", isLeading: true),
      body: GetBuilder<EditProfileScreenController>(
        init: editProfileController,
        builder: (_) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.primaryColor),
                      image: DecorationImage(
                          image: editProfileController.selectedImage != null
                              ? FileImage(editProfileController.selectedImage ??
                                  File(""))
                              : AssetImage(AppAssets.avatarImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 14.w,
                    child: GestureDetector(
                      onTap: () {
                        editProfileController.pickImage();
                      },
                      child: Icon(Icons.camera_alt_outlined,
                          size: 30.sp, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              50.h.verticalSpace,
              TextFieldWidget(
                  controller: editProfileController.nameController,
                  labelText: "Name",
                  prefixIcon: Icon(Icons.email, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  controller: editProfileController.phoneNumberController,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                readOnly: true,
                controller: editProfileController.dobController,
                labelText: "DOB",
                hintText: "DOB",
                suffixIcon: GestureDetector(
                  onTap: () {
                    editProfileController.selectDate(context);
                  },
                  child: Icon(Icons.date_range, color: AppColor.primaryColor),
                ),
              ),
              20.h.verticalSpace,
              CustomDropdownWidget(
                  value: editProfileController.genderValue,
                  genderOptions: editProfileController.genderOptions,
                  onChanged: (newValue) {
                    editProfileController.selectGender(newValue ?? "");
                  }),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: editProfileController.addressController,
                  labelText: "Address",
                  prefixIcon:
                      Icon(Icons.location_on, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: editProfileController.healthGoalsController,
                  labelText: "Health Goals",
                  prefixIcon: Icon(Icons.sports_gymnastics_outlined,
                      color: AppColor.primaryColor)),
              80.h.verticalSpace,
              CustomButtonWidget(
                  title: "Update",
                  onTap: () {
                    Get.back();
                  }),
              70.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
