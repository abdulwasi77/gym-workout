import 'dart:io';
import 'package:gym_workout/utils/export_all.dart';

class TrainerCreateProfileScreen extends StatelessWidget {
  const TrainerCreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trainerCreateProfileController =
        Get.put(TrainerCreateProfileScreenController());
    return Scaffold(
      appBar:
          CustomAppBars.primaryAppBar(title: "Create Profile", isLeading: true),
      body: GetBuilder<TrainerCreateProfileScreenController>(
        init: trainerCreateProfileController,
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
                          image: trainerCreateProfileController.selectedImage !=
                                  null
                              ? FileImage(trainerCreateProfileController
                                      .selectedImage ??
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
                        trainerCreateProfileController.pickImage();
                      },
                      child: Icon(Icons.camera_alt_outlined,
                          size: 30.sp, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              50.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerCreateProfileController.nameController,
                  labelText: "Name",
                  prefixIcon: Icon(Icons.email, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  controller:
                      trainerCreateProfileController.phoneNumberController,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                readOnly: true,
                controller: trainerCreateProfileController.dobController,
                labelText: "DOB",
                hintText: "DOB",
                suffixIcon: GestureDetector(
                  onTap: () {
                    trainerCreateProfileController.selectDate(context);
                  },
                  child: Icon(Icons.date_range, color: AppColor.primaryColor),
                ),
              ),
              20.h.verticalSpace,
              CustomDropdownWidget(
                  value: trainerCreateProfileController.genderValue,
                  genderOptions: trainerCreateProfileController.genderOptions,
                  onChanged: (newValue) {
                    trainerCreateProfileController.selectGender(newValue ?? "");
                  }),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller: trainerCreateProfileController.addressController,
                  labelText: "Address",
                  prefixIcon:
                      Icon(Icons.location_on, color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller:
                      trainerCreateProfileController.specialtyController,
                  labelText: "Specialty",
                  prefixIcon: Icon(Icons.sports_gymnastics_outlined,
                      color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller:
                      trainerCreateProfileController.experienceController,
                  labelText: "Experience",
                  prefixIcon: Icon(Icons.explore_rounded,
                      color: AppColor.primaryColor)),
              20.h.verticalSpace,
              TextFieldWidget(
                  controller:
                      trainerCreateProfileController.certificationsController,
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
                    if (!trainerCreateProfileController.selectedDays
                        .contains(newValue)) {
                      trainerCreateProfileController
                          .addAvaibility(newValue ?? "");
                    } else {
                      AppToasts.errorToast(title: "Already Added");
                    }
                  }),
              SizedBox(
                  width: Get.width * .9,
                  height: trainerCreateProfileController.selectedDays.isEmpty
                      ? 0
                      : Get.height * .1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        trainerCreateProfileController.selectedDays.length,
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
                                  title: trainerCreateProfileController
                                      .selectedDays[index]),
                            ),
                          ).paddingSymmetric(horizontal: 5, vertical: 20.h),
                          Positioned(
                            right: 0,
                            top: 12.h,
                            child: GestureDetector(
                              onTap: () {
                                trainerCreateProfileController.selectedDays
                                    .removeAt(index);
                                trainerCreateProfileController.update();
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
                  controller: trainerCreateProfileController.aboutController,
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
