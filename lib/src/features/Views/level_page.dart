import 'package:change30/src/core/components/widgets/app_title_widget.dart';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/Controllers/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DifficultyGamification {
  const DifficultyGamification({
    required this.title,
    required this.stars,
    required this.xpMultiplier,
    required this.badge,
    required this.recommendedReps,
    required this.color,
  });

  final String title;
  final int stars;
  final double xpMultiplier;
  final String badge;
  final String recommendedReps;
  final Color color;
}

const List<DifficultyGamification> difficultyProfiles = [
  DifficultyGamification(
    title: 'Beginner Mode',
    stars: 1,
    xpMultiplier: 1.0,
    badge: 'Starter',
    recommendedReps: '8-10',
    color: Color(0xFF7CB342),
  ),
  DifficultyGamification(
    title: 'Advanced Mode',
    stars: 2,
    xpMultiplier: 1.25,
    badge: 'Challenger',
    recommendedReps: '10-12',
    color: Color(0xFF42A5F5),
  ),
  DifficultyGamification(
    title: 'Hard Mode',
    stars: 3,
    xpMultiplier: 1.5,
    badge: 'Warrior',
    recommendedReps: '12-14',
    color: Color(0xFFFFB300),
  ),
  DifficultyGamification(
    title: 'Beast Mode',
    stars: 4,
    xpMultiplier: 1.8,
    badge: 'Beast',
    recommendedReps: '14-16',
    color: Color(0xFFFF7043),
  ),
  DifficultyGamification(
    title: 'One Punch Man',
    stars: 5,
    xpMultiplier: 2.2,
    badge: 'Hero',
    recommendedReps: '16-20',
    color: Color(0xFF8E24AA),
  ),
  DifficultyGamification(
    title: 'David Goggins',
    stars: 6,
    xpMultiplier: 3.0,
    badge: 'Unbreakable',
    recommendedReps: '20+',
    color: Color(0xFFEF5350),
  ),
];

class LevelSelectionPage extends ConsumerStatefulWidget {
  const LevelSelectionPage({super.key});

  @override
  ConsumerState<LevelSelectionPage> createState() => _LevelSelectionPageState();
}

class _LevelSelectionPageState extends ConsumerState<LevelSelectionPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final exProvider = ref.watch(excerciseProvider);
    final profile = difficultyProfiles[selectedIndex];

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            spaceSmallH15(),
            const AppTitleWidget(
              title1: 'LEV',
              title2: 'ELS',
              padding: 0,
            ),
            spaceSmallH15(),
            Text('Choose A level', style: smallTitleTextStyle()),
            spaceSmallH15(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: profile.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: profile.color, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aktif Seri: ${profile.title}',
                      style: smallTitleTextStyle(fsize: 16)),
                  const SizedBox(height: 6),
                  Row(
                    children: List.generate(
                      profile.stars,
                      (index) => Icon(Icons.star,
                          color: profile.color, size: 18),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rozet: ${profile.badge} • XP x${profile.xpMultiplier.toStringAsFixed(2)} • Tekrar: ${profile.recommendedReps}',
                    style: smallTitleTextStyle(fsize: 13),
                  ),
                ],
              ),
            ),
            spaceMediumH25(),
            SizedBox(
              height: context.deviceHeight > 375
                  ? context.deviceHeight * 0.5
                  : context.deviceHeight * 0.63,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: exProvider.difficultyList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: context.deviceHeight * 0.18,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return LevelSelectionWidget(
                    title: exProvider.difficultyList[index],
                    profile: difficultyProfiles[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() => selectedIndex = index);
                      Navigator.pushNamed(
                        context,
                        '/selectedChallenge',
                        arguments: difficultyProfiles[index],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LevelSelectionWidget extends StatelessWidget {
  const LevelSelectionWidget({
    super.key,
    required this.title,
    required this.profile,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final DifficultyGamification profile;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? profile.color.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? profile.color : Colors.black,
            width: isSelected ? 2.8 : 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  profile.stars,
                  (index) => Icon(Icons.bolt, color: profile.color, size: 14),
                ),
              ),
              const Spacer(),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    smallTitleTextStyle(fsize: 16, color: AppConstants.primaryColor),
              ),
              const SizedBox(height: 4),
              Text(
                'XP x${profile.xpMultiplier.toStringAsFixed(2)}',
                style: smallTitleTextStyle(fsize: 12, color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
