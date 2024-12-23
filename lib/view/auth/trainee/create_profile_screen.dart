import 'dart:io';
import 'package:gym_workout/utils/export_all.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final createProfileController = Get.put(CreateProfileScreenController());
    return Scaffold(
      appBar:
          CustomAppBars.primaryAppBar(title: "Create Profile", isLeading: true),
      body: GetBuilder<CreateProfileScreenController>(
        init: createProfileController,
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
                          image: createProfileController.selectedImage != null
                              ? FileImage(
                                  createProfileController.selectedImage ??
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
                        createProfileController.pickImage();
                      },
                      child: Icon(Icons.camera_alt_outlined,
                          size: 30.sp, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              50.h.verticalSpace,
              TextFieldWidget(
                  controller: createProfileController.nameController,
                  labelText: "Name",
                  prefixIcon: Icon(Icons.email, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  controller: createProfileController.phoneNumberController,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                readOnly: true,
                controller: createProfileController.dobController,
                labelText: "DOB",
                hintText: "DOB",
                suffixIcon: GestureDetector(
                  onTap: () {
                    createProfileController.selectDate(context);
                  },
                  child: Icon(Icons.date_range, color: AppColor.primaryColor),
                ),
              ),
              20.h.verticalSpace,
              CustomDropdownWidget(
                  value: createProfileController.genderValue,
                  genderOptions: createProfileController.genderOptions,
                  onChanged: (newValue) {
                    createProfileController.selectGender(newValue ?? "");
                  }),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: createProfileController.addressController,
                  labelText: "Address",
                  prefixIcon:
                      Icon(Icons.location_on, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: createProfileController.healthGoalsController,
                  labelText: "Health Goals",
                  prefixIcon: Icon(Icons.sports_gymnastics_outlined,
                      color: AppColor.primaryColor)),
              80.h.verticalSpace,
              CustomButtonWidget(
                  title: "Continue",
                  onTap: () {
                    // final controller = Get.put(SegrecationController());
                    // controller.segrecationFunc(AppConstants.trainee);
                    Get.offAll(() => const BottomNavbar());
                  }),
              70.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
