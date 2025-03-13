import 'package:gym_workout/components/cached_netwok_image_widget.dart';
import 'package:gym_workout/utils/export_all.dart';

class VegetablesScreen extends StatelessWidget {
  const VegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(title: "Today", isLeading: true),
      bottomNavigationBar: CustomButtonWidget(title: "Complete", onTap: () {})
          .paddingSymmetric(vertical: 15.h, horizontal: 20.w),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            70.h.verticalSpace,
            SizedBox(
              height: Get.height,
              child: PageView(
                children: [
                  _pageOneWidget(),
                  _pageTwoWidget(),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}

Widget _pageOneWidget() {
  return Column(
    children: [
      Container(
        height: 160.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxEw08LXAGv_8ZrJO3CaSJsGWQbjXmeB1h_g&s",
              )),
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.yellowColor, width: 4.w),
        ),
      ),
      Center(
          child:
              AppTexts.darkBlackText(title: "Eat Vegetables\nwith each meal")),
      Center(child: AppTexts.hintText(title: "Scheduled")),
      SizedBox(
        height: 100.h,
        child: const CachedNetworkImageComponent(
            imageUrl:
                "https://png.pngtree.com/png-vector/20240202/ourmid/pngtree-fist-punching-png-illustration-png-image_11587953.png"),
      ),
      Center(child: AppTexts.hintText(title: "2 fists"))
    ],
  );
}

Widget _pageTwoWidget() {
  final List<String> vegetables = [
    'Cauliflower, broccoli, brussel sprouts',
    'Tomatoes',
    'Sweet/bell peppers',
    'Bok choy',
    'Kale, swiss chard',
    'Green beans',
    'Sweet peas or snow peas',
    'Eggplant',
  ];
  return Column(
    spacing: 20.h,
    children: [
      Center(child: AppTexts.darkBlackText(title: "Veggies")),
      Container(
        height: 160.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxEw08LXAGv_8ZrJO3CaSJsGWQbjXmeB1h_g&s",
              )),
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.yellowColor, width: 4.w),
        ),
      ),
      SizedBox(
        height: Get.height * .7,
        child: ListView.builder(
          itemExtent: 40.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vegetables.length,
          itemBuilder: (context, index) {
            return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.radio_button_checked_outlined),
                title: AppTexts.blackText(
                  title: vegetables[index],
                ));
          },
        ),
      ),
    ],
  ).paddingSymmetric(horizontal: 10.w);
}
