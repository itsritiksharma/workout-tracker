enum Strength {
  weak,
  active,
  strong,
}

class WorkoutData {
  final num? reps;
  final num? goal;
  final int? pr;
  final String workout;

  WorkoutData(this.reps, this.pr, this.goal, this.workout);
}
