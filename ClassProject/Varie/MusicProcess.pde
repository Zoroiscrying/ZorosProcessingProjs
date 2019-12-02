import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.sound.*;

class MusicProcess {
  Minim minim;
  AudioPlayer song;
  ddf.minim.analysis.FFT fft;

  float band;
  float freq;
  float left;
  float right;

  MusicProcess() {
    init();
  }

  void init() {
    minim = new Minim(Varie.this);

    song = minim.loadFile("Song02.mp3");
    song.loop();
    startTime = second();

    fft = new ddf.minim.analysis.FFT(song.bufferSize(), song.sampleRate());
    fft.linAverages( 30 );
  }


  void update() {  
    fft.forward(song.mix);
    band = fft.getBand(26);
    
    freq = fft.getAvg(1);
    
    left = abs(song.left.get(0) * 50);
    right = abs(song.right.get(0) * 50);   //alpha

    //println(band, freq, left, right);
    
    
    
  }
}


//float p_weight = 3.5;
//int ph_ = 125;


//AudioPlayer song;
//Minim minim;
//ddf.minim.analysis.FFT fft;


//void sound() {
//  fft.forward(song.mix);
//  float fB, fF, fl;

//  for (int i=0; i<fft.specSize(); i+=50) {
//    fB = pow(fft.getBand(i), 0.11);
//    fF = cos(fft.getFreq(i));
//    fl = sin(song.left.get(i)*5);

//    a0 = map(fB, 0.5, 1, 0.1, 2.7);
//    depth = (int)map(fF, -1, 1, 65, 90); 
//    ph_ = (int)map(fl, -1, 1, 0, 255);

//    //println(ph_);
//  }
