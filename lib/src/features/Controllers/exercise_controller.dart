import 'package:change30/src/features/models/exercise_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseController extends ChangeNotifier {
  List<Exercises> exerciseList = [Exercises(name: "pushup")];

  final difficultyList = [
    "Beginner Mode",
    "Advanced Mode",
    "Hard Mode",
    "Beast Mode",
    "One Punch Man",
    "David Goggins"
  ];
  List<Exercises> basicHomeWorkoutExercises = [
    Exercises(
      name: "Push-ups",
      description:
          "Get into a plank position with your hands shoulder-width apart. Lower your body by bending your elbows until your chest nearly touches the floor, then push back up to the starting position.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Squats",
      description:
          "Stand with feet shoulder-width apart. Lower your hips back and down as if sitting in a chair, keeping your back straight, and then stand back up.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Lunges",
      description:
          "Stand with feet hip-width apart. Take a step forward with one leg, lower your body until both knees are bent at 90 degrees, then push back up to the starting position and switch legs.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Plank",
      description:
          "Lie face down on the floor, then lift your body onto your forearms and toes. Keep your body in a straight line from head to heels, engaging your core muscles.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Jumping Jacks",
      description:
          "Stand with feet together and arms by your side. Jump while spreading your legs apart and raising your arms overhead, then jump back to the starting position.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Tricep Dips",
      description:
          "Sit on the edge of a chair or bench, gripping the edges with your hands. Lower your body by bending your elbows, then push back up to the starting position.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Burpees",
      description:
          "Stand with feet shoulder-width apart. Drop into a squat, kick your feet back into a plank, do a push-up, jump your feet back to the squat position, and jump up explosively with your arms overhead.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Mountain Climbers",
      description:
          "Get into a plank position with your arms straight. Alternate bringing one knee towards your chest and then quickly switch legs in a running motion.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Russian Twists",
      description:
          "Sit on the floor with your knees bent, leaning slightly back. Rotate your torso to one side, then to the other, while holding a weight or clasping your hands.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Superman",
      description:
          "Lie face down on the floor with arms and legs extended. Lift your arms, chest, and legs off the ground simultaneously, engaging your lower back muscles.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Bridge",
      description:
          "Lie on your back with knees bent and feet flat on the floor. Lift your hips off the ground until your body forms a straight line from shoulders to knees.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "High Knees",
      description:
          "Stand with feet hip-width apart. Lift one knee towards your chest while hopping on the other foot, then quickly switch legs.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Calf Raises",
      description:
          "Stand with feet shoulder-width apart. Raise your heels off the ground by standing on tiptoes, then lower them back down.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Glute Bridges",
      description:
          "Lie on your back with knees bent and feet flat on the floor. Lift your hips off the ground until your body forms a straight line from shoulders to knees, squeezing your glutes at the top.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Side Plank",
      description:
          "Lie on your side with your elbow directly under your shoulder. Lift your hips off the ground, creating a straight line from your head to your feet, supporting your weight on your forearm.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Wall Sits",
      description:
          "Stand with your back against a wall and feet shoulder-width apart. Slide your back down the wall until your thighs are parallel to the ground, holding the position for the desired time.",
      difficulty: "Beginner",
    ),
    Exercises(
      name: "Bicycle Crunches",
      description:
          "Lie on your back with your hands behind your head and knees bent. Bring one knee towards your chest while simultaneously twisting your torso to bring the opposite elbow towards that knee. Alternate sides.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Tricep Push-ups",
      description:
          "Get into a plank position with your hands close together, forming a diamond shape with your thumbs and index fingers. Lower your body by bending your elbows, keeping your elbows close to your sides, then push back up to the starting position.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Inchworm",
      description:
          "Stand with feet hip-width apart. Bend forward at the hips and place your hands on the floor, then walk your hands forward until you're in a plank position, and walk your feet towards your hands.",
      difficulty: "Intermediate",
    ),
    Exercises(
      name: "Side Lunges",
      description:
          "Stand with feet together. Take a step to the side with one leg, bending the knee and pushing your hips back. Keep the other leg straight. Return to the starting position and switch sides.",
      difficulty: "Intermediate",
    ),
  ];
}

final excerciseProvider = Provider((ref) {
  return ExerciseController();
});
