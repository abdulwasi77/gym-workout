import 'package:gym_workout/utils/export_all.dart';
import 'package:intl/intl.dart';

class WorkoutPlanScreen extends StatefulWidget {
  const WorkoutPlanScreen({super.key});

  @override
  _WorkoutPlanScreenState createState() => _WorkoutPlanScreenState();
}

class _WorkoutPlanScreenState extends State<WorkoutPlanScreen> {
  String? _selectedCategory = 'Strength';
  String? _selectedPlan;
  List<String> _selectedWorkouts = [];
  bool isLoading = false;
  DateTime _startDate = DateTime.now(); // Start date for the task
  DateTime? _endDate; // End date for the task
  String _taskFrequency = 'One Day'; // Task frequency: One Day, Week, or Month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assign Workout Plan"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Frequency Dropdown (One Day, Week, Month)
              Text(
                "Select Task Frequency:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Task Frequency",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                value: _taskFrequency,
                items: ['One Day', 'Week', 'Month']
                    .map((frequency) => DropdownMenuItem(
                          value: frequency,
                          child: Text(frequency),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _taskFrequency = value!;
                    _endDate = null; // Clear end date when frequency changes
                    if (_taskFrequency != 'Week' && _taskFrequency != 'Month') {
                      _startDate =
                          DateTime.now(); // Reset to current date for "One Day"
                    }
                  });
                },
              ),
              SizedBox(height: 20.h),

              // Date Selection (depending on task frequency)
              Text(
                "Select Task Date Range:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: _selectStartDate, // Trigger start date picker
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
              SizedBox(height: 10.h),

              if (_taskFrequency != 'One Day')
                InkWell(
                  onTap: _selectEndDate, // Trigger end date picker
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "End Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      _endDate != null
                          ? DateFormat('MMMM d, yyyy').format(_endDate!)
                          : 'Select End Date',
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColor.blackColor),
                    ),
                  ),
                ),
              SizedBox(height: 20.h),

              // Category Dropdown
              Text(
                "Select Workout Category:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                value: _selectedCategory,
                items: ["Strength", "Cardio", "Flexibility"]
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                    _selectedPlan = null;
                    _selectedWorkouts.clear();
                  });
                },
              ),
              SizedBox(height: 20.h),

              // Plan Dropdown
              Text(
                "Select Plan for $_selectedCategory:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Plan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                value: _selectedPlan,
                items: _getWorkoutPlans(_selectedCategory)
                    .map((plan) => DropdownMenuItem(
                          value: plan,
                          child: Text(plan),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPlan = value;
                    _selectedWorkouts.clear(); // Clear previous selections
                  });
                },
              ),
              SizedBox(height: 30.h),

              // Show Workouts if Plan is Selected
              if (_selectedPlan != null) _buildWorkoutSelections(),

              // Spacer for better UI
              // const Spacer(),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _assignWorkoutPlan,
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

  // Get workout plans based on the selected category
  List<String> _getWorkoutPlans(String? category) {
    if (category == 'Strength') {
      return [
        'Beginner Strength',
        'Intermediate Strength',
        'Advanced Strength'
      ];
    } else if (category == 'Cardio') {
      return ['Beginner Cardio', 'Intermediate Cardio', 'HIIT'];
    } else if (category == 'Flexibility') {
      return ['Yoga Beginner', 'Yoga Intermediate', 'Advanced Flexibility'];
    }
    return [];
  }

  // Build the workout selections widget
  Widget _buildWorkoutSelections() {
    final workouts = _getAvailableWorkoutsForPlan(_selectedPlan);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Workouts:",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        ...workouts.map((workout) => CheckboxListTile(
              value: _selectedWorkouts.contains(workout),
              onChanged: (selected) {
                setState(() {
                  if (selected == true) {
                    _selectedWorkouts.add(workout);
                  } else {
                    _selectedWorkouts.remove(workout);
                  }
                });
              },
              title: Text(workout),
              controlAffinity: ListTileControlAffinity.leading,
            )),
      ],
    );
  }

  // Get available workouts based on the selected plan
  List<String> _getAvailableWorkoutsForPlan(String? plan) {
    if (plan == 'Beginner Strength') {
      return ['Push-ups', 'Squats', 'Planks'];
    } else if (plan == 'HIIT') {
      return ['Jump Rope', 'Burpees', 'Mountain Climbers'];
    } else if (plan == 'Yoga Beginner') {
      return ['Downward Dog', 'Warrior Pose', 'Tree Pose'];
    } else if (plan == 'Advanced Flexibility') {
      return ['Pigeon Pose', 'Split Stretches', 'Bridge Pose'];
    }
    return [];
  }

  // Assign workout plan and show a success message
  void _assignWorkoutPlan() async {
    if (_selectedWorkouts.isEmpty) {
      Get.snackbar("Error", "Please select at least one workout.");
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2)); // Simulating assignment
    setState(() {
      isLoading = false;
    });

    String taskPeriod;
    if (_taskFrequency == 'One Day') {
      taskPeriod = DateFormat('MMMM d, yyyy').format(_startDate);
    } else if (_taskFrequency == 'Week') {
      taskPeriod =
          "Week starting on ${DateFormat('MMMM d, yyyy').format(_startDate)}";
    } else {
      taskPeriod =
          "Month starting on ${DateFormat('MMMM d, yyyy').format(_startDate)}";
    }

    Get.snackbar(
      "Success",
      "Workout plan assigned for $taskPeriod!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Select start date
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
        // Reset end date when selecting new start date
        if (_taskFrequency == 'Week') {
          _endDate =
              _startDate.add(Duration(days: 6)); // Set end date for the week
        } else if (_taskFrequency == 'Month') {
          _endDate = DateTime(_startDate.year, _startDate.month + 1,
              0); // Set end date for the month
        }
      });
    }
  }

  // Select end date (for Week or Month)
  Future<void> _selectEndDate() async {
    DateTime lastDate = _taskFrequency == 'Week'
        ? _startDate.add(Duration(days: 6))
        : _taskFrequency == 'Month'
            ? DateTime(_startDate.year, _startDate.month + 1, 0)
            : DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate,
      firstDate: _startDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }
}
