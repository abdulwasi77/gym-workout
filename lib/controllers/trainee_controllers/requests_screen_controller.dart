import 'package:gym_workout/utils/export_all.dart';

class RequestsScreenController extends GetxController {
  List<Map<String, dynamic>> trainers = [
    {
      "name": "John Doe",
      "status": "pending",
      "image": AppAssets.avatarImage,
      "specialty": "Yoga"
    },
    {
      "name": "Jane Smith",
      "status": "accepted",
      "image": AppAssets.avatarImage,
      "specialty": "Pilates"
    },
    {
      "name": "Mark Lee",
      "status": "rejected",
      "image": AppAssets.avatarImage,
      "specialty": "Cardio"
    },
    {
      "name": "Emily Johnson",
      "status": "pending",
      "image": AppAssets.avatarImage,
      "specialty": "Strength Training"
    },
    {
      "name": "Jack",
      "status": "accepted",
      "image": AppAssets.avatarImage,
      "specialty": "Cardio"
    },
    {
      "name": "Mitchel",
      "status": "rejected",
      "image": AppAssets.avatarImage,
      "specialty": "Strength Training"
    },
  ];

  Color getStatusColor(String? status) {
    if (status == "Pending") {
      return AppColor.orangeColor;
    } else if (status == "accepted") {
      return AppColor.greenColor;
    } else if (status == "rejected") {
      return AppColor.redColor;
    } else {
      return AppColor.greyColor;
    }
  }
}
