import 'dart:io';
import 'package:gym_workout/utils/export_all.dart';

class TrainerEditProfileScreen extends StatelessWidget {
  const TrainerEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trainerEditProfileController =
        Get.put(TrainerEditProfileScreenController());
    return Scaffold(
      appBar:
          CustomAppBars.primaryAppBar(title: "Edit Profile", isLeading: true),
      body: GetBuilder<TrainerEditProfileScreenController>(
        init: trainerEditProfileController,
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
                          image: trainerEditProfileController.selectedImage !=
                                  null
                              ? FileImage(
                                  trainerEditProfileController.selectedImage ??
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
                        trainerEditProfileController.pickImage();
                      },
                      child: Icon(Icons.camera_alt_outlined,
                          size: 30.sp, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              50.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerEditProfileController.nameController,
                  labelText: "Name",
                  prefixIcon: Icon(Icons.email, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  controller:
                      trainerEditProfileController.phoneNumberController,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                readOnly: true,
                controller: trainerEditProfileController.dobController,
                labelText: "DOB",
                hintText: "DOB",
                suffixIcon: GestureDetector(
                  onTap: () {
                    trainerEditProfileController.selectDate(context);
                  },
                  child: Icon(Icons.date_range, color: AppColor.primaryColor),
                ),
              ),
              20.h.verticalSpace,
              CustomDropdownWidget(
                  value: trainerEditProfileController.genderValue,
                  genderOptions: trainerEditProfileController.genderOptions,
                  onChanged: (newValue) {
                    trainerEditProfileController.selectGender(newValue ?? "");
                  }),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerEditProfileController.addressController,
                  labelText: "Address",
                  prefixIcon:
                      Icon(Icons.location_on, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerEditProfileController.specialtyController,
                  labelText: "Specialty",
                  prefixIcon: Icon(Icons.sports_gymnastics_outlined,
                      color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerEditProfileController.experienceController,
                  labelText: "Experience",
                  prefixIcon: Icon(Icons.explore_rounded,
                      color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller:
                      trainerEditProfileController.certificationsController,
                  labelText: "Certifications",
                  prefixIcon:
                      Icon(Icons.edit_document, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              CustomDropdownWidget(
                  hintText: "Select Days Available",
                  genderOptions: const [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday"
                  ],
                  onChanged: (newValue) {
                    if (!trainerEditProfileController.selectedDays
                        .contains(newValue)) {
                      trainerEditProfileController
                          .addAvaibility(newValue ?? "");
                    } else {
                      AppToasts.errorToast(title: "Already Added");
                    }
                  }),
              SizedBox(
                  width: Get.width * .9,
                  height: trainerEditProfileController.selectedDays.isEmpty
                      ? 0
                      : Get.height * .1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trainerEditProfileController.selectedDays.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          20.h.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: AppTexts.themeText(
                                  title: trainerEditProfileController
                                      .selectedDays[index]),
                            ),
                          ).paddingSymmetric(horizontal: 5, vertical: 20.h),
                          Positioned(
                            right: 0,
                            top: 12.h,
                            child: GestureDetector(
                              onTap: () {
                                trainerEditProfileController.selectedDays
                                    .removeAt(index);
                                trainerEditProfileController.update();
                              },
                              child: Icon(Icons.close, size: 18.sp),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerEditProfileController.aboutController,
                  labelText: "About",
                  prefixIcon: Icon(Icons.description_sharp,
                      color: AppColor.primaryColor)),
              80.h.verticalSpace,
              CustomButtonWidget(
                  title: "Continue",
                  onTap: () {
                    // final controller = Get.put(SegrecationController());
                    // controller.segrecationFunc(AppConstants.trainer);
                    Get.offAll(() => const BottomNavbar());
                  }),
              70.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }
}
