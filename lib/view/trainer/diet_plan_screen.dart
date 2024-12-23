import 'package:intl/intl.dart';
import 'package:gym_workout/utils/export_all.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key});

  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  String? _selectedGoal = 'Weight Loss';
  double _proteinIntake = 50.0;
  double _carbIntake = 150.0;
  double _fatIntake = 60.0;
  DateTime _startDate = DateTime.now(); // Start date for diet plan
  DateTime? _endDate; // End date for diet plan
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assign Diet Plan"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Diet Goal Selection
              Text(
                "Select Diet Goal:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Goal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                value: _selectedGoal,
                items: ["Weight Loss", "Muscle Gain", "General Health"]
                    .map((goal) => DropdownMenuItem(
                          value: goal,
                          child: Text(goal),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGoal = value;
                  });
                },
              ),
              SizedBox(height: 20.h),

              // Adjust Macronutrients
              Text(
                "Adjust Macronutrients for $_selectedGoal:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              _buildMacronutrientSlider("Protein Intake", _proteinIntake,
                  (value) {
                setState(() {
                  _proteinIntake = value;
                });
              }),
              SizedBox(height: 10.h),
              _buildMacronutrientSlider("Carb Intake", _carbIntake, (value) {
                setState(() {
                  _carbIntake = value;
                });
              }),
              SizedBox(height: 10.h),
              _buildMacronutrientSlider("Fat Intake", _fatIntake, (value) {
                setState(() {
                  _fatIntake = value;
                });
              }),

              // Start Date Picker
              SizedBox(height: 30.h),
              Text(
                "Select Start Date:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: _selectStartDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Start Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    DateFormat('MMMM d, yyyy').format(_startDate),
                    style:
                        TextStyle(fontSize: 16.sp, color: AppColor.blackColor),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // End Date Picker
              Text(
                "Select End Date:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: _selectEndDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "End Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    _endDate == null
                        ? "Select end date"
                        : DateFormat('MMMM d, yyyy')
                            .format(_endDate ?? DateTime.now()),
                    style:
                        TextStyle(fontSize: 16.sp, color: AppColor.blackColor),
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              // Duration Display (if End Date is selected)
              if (_endDate != null)
                Text(
                  "Duration: ${_calculateDuration()} days",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),

              // Assign Plan Button
              Center(
                child: ElevatedButton(
                  onPressed: _assignDietPlan,
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: AppColor.whiteColor)
                      : Text(
                          "Assign Plan",
                          style: TextStyle(
                              fontSize: 16.sp, color: AppColor.whiteColor),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build macronutrient sliders
  Widget _buildMacronutrientSlider(
      String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ${value.toInt()} g",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Slider(
          min: 40,
          max: 300,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Assign diet plan method
  void _assignDietPlan() async {
    if (_selectedGoal == null) {
      Get.snackbar("Error", "Please select a diet plan goal.");
      return;
    }
    if (_endDate == null) {
      Get.snackbar("Error", "Please select an end date.");
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2)); // Simulating assignment
    setState(() {
      isLoading = false;
    });
    Get.snackbar(
      "Success",
      "Diet plan assigned successfully from ${DateFormat('MMMM d, yyyy').format(_startDate)} to ${DateFormat('MMMM d, yyyy').format(_endDate ?? DateTime.now())}!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Date picker for start date
  Future<void> _selectStartDate() async {
    DateTime firstDate = DateTime.now();
    DateTime lastDate = DateTime(2030);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  // Date picker for end date
  Future<void> _selectEndDate() async {
    DateTime firstDate = _startDate;
    DateTime lastDate = DateTime(2030);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ??
          _startDate.add(const Duration(days: 30)), // Default 1 month
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  // Calculate the duration between start and end date
  String _calculateDuration() {
    if (_endDate != null) {
      final difference = _endDate?.difference(_startDate).inDays;
      return difference.toString();
    }
    return "0"; // Default if end date is not selected
  }
}
