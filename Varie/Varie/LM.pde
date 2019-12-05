import de.voidplus.leapmotion.*;
LeapMotion leap;

int MODE = 0; 

int t = 0;

public class HFLeap {
  private LeapMotion leap;

  float handPitch; //X
  float handYaw;   //Y
  float handRoll;  //Z
  float handGrab;
  float handPinch;

  PVector handPos;
  PVector preHandPos;
  PVector handDir;

  float maxSpeed = 10;


  public HFLeap() {

    this.leap = new LeapMotion(Varie.this);
    init();
  }


  private void init() {

    handPos = new PVector(0, 0, 0);
    preHandPos = new PVector(0, 0, 0);
    handDir = new PVector(0, 0, 0);
  }


  public void draw() {

    for (Hand hand : this.leap.getHands ()) {
      hand.draw();

      if (millis()/1000!=t) {
        t=millis()/1000;  
        check(hand);
      }
    }
  }

  public void update() {
    for (Hand hand : this.leap.getHands ()) {
      if (hand.isRight()) {
        handRoll           = hand.getRoll();
        handPitch          = hand.getPitch();
        handYaw            = hand.getYaw();
        handGrab           = hand.getGrabStrength();
        handPinch          = hand.getPinchStrength();    
        handPos            = hand.getPosition();

        handDir = handPos.sub(preHandPos);
        handDir.limit(maxSpeed);
        preHandPos = handPos;
      }
    }
  }


  void check(Hand hand) {
    String finger="";
    for (Finger f : hand.getFingers())finger+=f.isExtended()?1:0;
    switch(finger) {

    case "01000":
      MODE=1;
      break;

    case "01100":
      MODE=2;
      break;

    case "00111":
      MODE=3;
      break;

    case "01111":
      MODE=4;
      break;

    case "11111":
      MODE=5;
      break;

    default:
      MODE=0;
      return;
    }

    println(MODE);
  }
}











void leapOnInit() {
  println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnDisconnect() {
  println("Leap Motion Disconnect");
}
void leapOnExit() {
  println("Leap Motion Exit");
}
