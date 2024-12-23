import 'package:gym_workout/utils/export_all.dart';

class AllTrainers extends StatelessWidget {
  const AllTrainers({super.key});

  @override
  Widget build(BuildContext context) {
    final trainerController = Get.put(TrainersScreenController());
    trainerController.filteredTrainers = trainerController.trainers;
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: CustomAppBars.primaryAppBar(
        title: "Trainers",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu),
        ),
      ),
      body: GetBuilder<TrainersScreenController>(
        init: trainerController,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .75,
                    child: TextFieldWidget(
                      onChanged: trainerController.filterTrainers,
                      controller: trainerController.searchController,
                      labelText: "Search",
                      prefixIcon:
                          Icon(Icons.search, color: AppColor.primaryColor),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      _showFilterBottomSheet(context, trainerController);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240.sp,
                  ),
                  itemCount: trainerController.filteredTrainers.length,
                  itemBuilder: (context, index) {
                    final trainer = trainerController.filteredTrainers[index];
                    return TrainerCard(
                      favOntap: () {
                        trainerController.makeFavourite();
                      },
                      isFavorite: trainerController.isFavourite,
                      name: trainer["name"] ?? "",
                      specialty: trainer["specialty"] ?? "",
                      image: trainer["image"] ?? "",
                      onTap: () {
                        Get.to(() => TrainerDetailScreen(trainer: trainer));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showFilterBottomSheet(
    BuildContext context, TrainersScreenController controller) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)), // Smooth rounded top corners
    ),
    backgroundColor: AppColor.whiteColor, // White background for a clean look
    builder: (BuildContext context) {
      return GetBuilder<TrainersScreenController>(
        init: controller,
        builder: (_) => Padding(
          padding: EdgeInsets.all(26.0.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.blackText(
                  title: "Filter Trainers",
                  style: AppTextStyle.blackHeaderTextStyle),
              16.h.verticalSpace,
              _labelText("Specialty"),
              8.h.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedSpecialty,
                  onChanged: (String? newValue) {
                    controller.updateSpecialty(newValue);
                  },
                  hint: AppTexts.hintText(title: "Select Specialty"),
                  items: controller.specialties
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: AppTexts.blackText(title: value));
                  }).toList(),
                  underline:
                      const SizedBox(), // Remove the default underline of the dropdown
                ),
              ),
              16.h.verticalSpace,
              _labelText("Experience Level"),
              8.h.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedExperienceLevel,
                  onChanged: (String? newValue) {
                    controller.updateExperienceLevel(newValue);
                  },
                  hint: AppTexts.hintText(title: "Select Experience Level"),

                  items: controller.experienceLevels
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: AppTexts.blackText(title: value),
                    );
                  }).toList(),
                  underline:
                      const SizedBox(), // Remove the default underline of the dropdown
                ),
              ),
              24.h.verticalSpace,
              CustomButtonWidget(
                  title: "Apply Filters",
                  onTap: () {
                    controller.applyFilters();
                    Get.back();
                  }),
            ],
          ),
        ),
      );
    },
  );
}

Widget _labelText(String title) {
  return AppTexts.blackText(title: title);
}
