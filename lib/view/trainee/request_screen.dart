import 'package:gym_workout/utils/export_all.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requestController = Get.put(RequestsScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        title: "Requests",
        isLeading: true,
      ),
      body: GetBuilder<RequestsScreenController>(
        init: requestController,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: requestController.trainers.length,
                  itemBuilder: (context, index) {
                    final trainer = requestController.trainers[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor
                            .whiteColor, // White background for the card
                        borderRadius: BorderRadius.circular(
                            12.r), // Rounded corners for the card
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.blackColor.withValues(
                                alpha: 0.1), // Light shadow for depth
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 2), // Position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align everything to the left
                        children: [
                          // Trainer's Image and Name Row
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Trainer's Image
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(trainer["image"]),
                                      radius: 40.r, // Size of the image
                                    ),
                                    SizedBox(
                                        width: 16
                                            .w), // Spacing between image and name
                                    // Trainer's Name and Specialty
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTexts.blackText(
                                            title:
                                                trainer["name"] ?? "No Name"),
                                        4.h.verticalSpace,
                                        AppTexts.hintText(
                                            title: trainer["specialty"] ??
                                                "Specialty Unknown")
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                      color: requestController.getStatusColor(
                                          trainer[
                                              "status"]), // Set color based on status
                                      borderRadius: BorderRadius.circular(
                                          20.r), // Rounded status container
                                    ),
                                    child: AppTexts.secondaryText(
                                        title: trainer["status"]
                                                .toString()
                                                .capitalizeFirst ??
                                            "Unknown")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(
                        vertical: 12.h); // Padding around the card
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
