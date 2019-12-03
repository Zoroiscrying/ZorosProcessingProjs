class StopWatchTimer {
  
  int startTime = 0, stopTime = 0;
  boolean running = false;  
  int timeDelta = 0;
  int timeLastFrame;
  int timeThisFrame;
  
  int deltaTime(){
    timeThisFrame = millis();
    timeDelta = timeThisFrame - timeLastFrame;
    timeLastFrame = timeThisFrame;
    return timeDelta;
  }
    
    void start() {
        timeLastFrame = millis();
        startTime = millis();
        running = true;
    }
    void stop() {
        stopTime = millis();
        running = false;
    }
    
    int getElapsedTime() {
        int elapsed;
        if (running) {
             elapsed = (millis() - startTime);
        }
        else {
            elapsed = (stopTime - startTime);
        }
        return elapsed;
    }
    int second() {
      println((getElapsedTime() / 1000) % 60);
      return (getElapsedTime() / 1000) % 60;
    }
    int minute() {
      return (getElapsedTime() / (1000*60)) % 60;
    }
    int hour() {
      return (getElapsedTime() / (1000*60*60)) % 24;
    }
}
