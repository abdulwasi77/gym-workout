import 'package:gym_workout/utils/export_all.dart';

class TrainerCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final VoidCallback onTap;
  final VoidCallback favOntap;
  final bool isFavorite;

  const TrainerCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
    required this.onTap,
    required this.isFavorite,
    required this.favOntap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 140.h,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTexts.primaryText(title: name),
                  // Text(
                  //   name,
                  //   style: AppTextStyle.whiteTextStyle
                  //       .copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  // ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color:
                          isFavorite ? AppColor.redColor : AppColor.whiteColor,
                    ),
                    onPressed: favOntap,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, bottom: 8.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .18,
                    child: AppTexts.secondaryText(
                      title: specialty,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Text(
                    //   specialty,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: AppTextStyle.whiteTextStyle.copyWith(fontSize: 14),
                    // ),
                  ),
                  Row(
                    children: [
                      RatingBar.readOnly(
                        size: 22.sp,
                        filledColor: AppColor.blackColor,
                        emptyColor: AppColor.whiteColor,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        // onRatingChanged: (value) => debugPrint('$value'),
                        initialRating: 3,
                        maxRating: 1,
                      ),
                      5.w.horizontalSpace,
                      AppTexts.blackText(
                        title: "4.8",
                      ).paddingOnly(right: 8.0.w)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
