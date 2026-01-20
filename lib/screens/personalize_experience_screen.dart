import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../widgets/primary_button.dart';

class PersonaliseExperienceScreen extends StatefulWidget {
  const PersonaliseExperienceScreen({super.key});

  @override
  State<PersonaliseExperienceScreen> createState() =>
      _PersonaliseExperienceScreenState();
}

class _PersonaliseExperienceScreenState
    extends State<PersonaliseExperienceScreen> {
  final List<String> interests = [
    "User Interface",
    "User Experience",
    "User Research",
    "UX Writing",
    "User Testing",
    "Service Design",
    "Strategy",
    "Design Systems",
  ];
  double get progressValue {
    return selectedInterests.length / interests.length;
  }


  final Set<String> selectedInterests = {};

  void toggleSelection(String item) {
    setState(() {
      if (selectedInterests.contains(item)) {
        selectedInterests.remove(item);
      } else {
        selectedInterests.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.screenHeight,
          color: Colors.white,
          padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 68),

              // 🔹 Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          width: constraints.maxWidth * progressValue,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    );
                  },
                ),


              ),

              const SizedBox(height: 32),

              // 🔹 Title
              const Text(
                "Personalise your\nexperience",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Choose your interests.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF71727A),
                ),
              ),

              const SizedBox(height: 40),

              // 🔹 Interests list
              Expanded(
                child: ListView.separated(
                  itemCount: interests.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = interests[index];
                    final isSelected = selectedInterests.contains(item);

                    return GestureDetector(
                      onTap: () {
                        toggleSelection(item);
                      },
                      child: Container(
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFEAF2FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.white
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check,
                                color: AppColors.primary,
                                size: 16,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              // 🔹 Next button
              PrimaryButton(
                text: "Next",
                onTap: () {
                  print("Next Clicked");
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
