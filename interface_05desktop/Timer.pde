class TimerGraph {
  int savedTime;
  int totalTime;

  TimerGraph(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int timePassed = millis() - savedTime;
    if (timePassed > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}