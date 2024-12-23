import 'package:gym_workout/utils/export_all.dart';

class FavouriteTrainersScreen extends StatelessWidget {
  const FavouriteTrainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteTrainerController = Get.put(FavouriteTrainersController());
    favouriteTrainerController.filteredTrainers =
        favouriteTrainerController.trainers;
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        isLeading: true,
        title: "Favourite Trainers",
      ),
      body: GetBuilder<FavouriteTrainersController>(
        init: favouriteTrainerController,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240.sp,
                  ),
                  itemCount: favouriteTrainerController.filteredTrainers.length,
                  itemBuilder: (context, index) {
                    final trainer =
                        favouriteTrainerController.filteredTrainers[index];
                    return TrainerCard(
                      favOntap: () {
                        favouriteTrainerController.makeFavourite();
                      },
                      isFavorite: favouriteTrainerController.isFavourite,
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
