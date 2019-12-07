/**
 *	Tutorial code by Matthieu Savary
 *	as featured on http://smallab.org/download/42/
 *	
 *	Please credit if you use any part of this in your own work!
 *	Distributed freely, for free, and with love
 *	Under the BSD License:
 *	
 *	
 *	Copyright (c) 2013, Matthieu Savary (SMALLAB.ORG)
 *	All rights reserved.
 *	
 *	Redistribution and use in source and binary forms, with or without
 *	modification, are permitted provided that the following conditions are met:
 *		* Redistributions of source code must retain the above copyright
 *		  notice, this list of conditions and the following disclaimer.
 *	    * Redistributions in binary form must reproduce the above copyright
 *	      notice, this list of conditions and the following disclaimer in the
 *	      documentation and/or other materials provided with the distribution.
 *	    * Neither the name of SMALLAB.ORG nor the
 *	      names of its contributors may be used to endorse or promote products
 *	      derived from this software without specific prior written permission.
 *	
 *	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 *	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 *	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *	DISCLAIMED. IN NO EVENT SHALL MATTHIEU SAVARY BE LIABLE FOR ANY
 *	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 *	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 *	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. *
 *
 *	
 *	Speaking of which, this sketch makes use of some concepts found
 *	in Robert Hodgin's flight404 blog. Can't spot the
 *	exact url anymore though, it dates back to September 2008.
 *
 *	This sketch uses video input to create "clouds" according to detected movement,
 *	that themselves generate "rain drops". Its purpose is to demonstrate the power
 *	of classes and objects to simulate cool, Nature-inspired behaviors.
 *	
 *
 *	For Processing 2.1 and (hopefully) later versions
 *	
 */


// We are going to need to use
// Processing's built-in video library.
// This is the right point for calling it.
import processing.video.*;

// Declaring our global variables.
boolean videoSetupIsDone;
int densityInverse;
int scatering;
float scaling;
int numPixels;
int[] backgroundPixels;
Capture video;
int sensitivityInverse;
// The following ArrayList is a special kind or Array:
// it's capable of changing size (you may add or remove items from it).
// In the following case we're defining that its objects are casted
// to our own, cool Cloud type. Cuz we want to add and remove clouds.
ArrayList<Cloud> clouds;


// Setting up our sketch in terms of size, frame rate,
// filling up our variables. That's typically setup()'s job.
void setup()
{
	// we are using the P3D renderer,
	// declaring it in size().
    size(1366, 768, P3D);
	frameRate(25);
	smooth(4);
    colorMode( RGB, 1.0 );
	rectMode(CENTER);
  
	// We are going to check what cameras are available,
	// using the Capture class.
	// On the Mac, the same camera can be used in several
	// resolutions and frame rates. Here we're going to
	// choose a small resolution (80x45) with a fast frame rate (30fps).
    String[] cameras = Capture.list();
  
    if (cameras.length == 0)
	{
    	println("There are no cameras available for capture.");
    	exit(); // terminate the sketch, because unfortunately, no camera is available.
    }
	else
	{
		println("Available cameras:");
		for (int i = 0; i < cameras.length; i++)
		{
			println(i+": "+cameras[i]);
		}

		// The camera can be initialized directly using an 
		// element from the array returned by Capture.list().
		// !!!!!!! using camera 12 on my iMac, your computer
		// might be better off with a smaller resolution!!!!!!!
		video = new Capture(this, cameras[12]);
		video.start();
    }      
	
	// Make the pixels[] array available for direct manipulation
	loadPixels();
  
	// Initializing a "video setup" flag, that we're using in draw()
	// to fire up the video only once. Once it's set to true,
	// it stays like this.
	videoSetupIsDone = false;
	
	// Initializing our other parameters: they mainly impact the drawing.
	// Don't hesitate to play with these!
	densityInverse = 1;
	scatering = 5;
	scaling = 8;
	sensitivityInverse = 75;
}


// And now comes a lot of fun, frame after frame.
void draw()
{
	background(1); // white, in colorMode(RGB, 1.0)
	
	if (video.available()) // Do all of the following only if video images are being grabbed.
	{
		
		video.read(); // Read a new video frame
		video.loadPixels(); // Make the pixels of video available
		// If we wanted to directly show the video capture, we'd use: image(video,0,0);
		// Try it out to see for yourself!
	
		// This is the place where we use the video setup flag:
		// these directives are followed only once by the sketch
		// in order to fire up the video.
		if (!videoSetupIsDone)
		{
			numPixels = video.width*video.height; // Count available video pixels,
			clouds = new ArrayList(); // initialize the clouds ArrayList,
			for (int i=0; i<numPixels; i+=densityInverse) // and fill it up with Cloud objects.
			{
				clouds.add(  new Cloud( i, new PVector(i%video.width*scatering, 0, (int)(i/video.height)*scatering) )  );
			}
			// ok now you can draw, because setup's done
			videoSetupIsDone = true;
			println("Video setup is done, once and for all!");
		}
		
		
		pushMatrix(); // Now we're drawing in 3D, "save" the current matrix to be on the safe side.
	
		// Global transformations happen here.
		translate( width/2.0 + video.width*scatering*scaling/2.0, -400, 0 );
		rotateY(PI);
		scale(scaling,scaling,1);

		// For each pixel in the video frame, have a cloud ready to drop some rain drops!
		for (int i=0; i <clouds.size(); i++)
		{ 
			color clr = video.pixels[i]; // grab the color of this video pixel
			float _brightness = ( ((clr >> 16) & 0xFF) + ((clr >> 8) & 0xFF) + (clr & 0xFF) )/3.0;
		  
			Cloud c = clouds.get(i); // Select this cloud from the clouds ArrayList and place it in a local variable,
			c.update(_brightness); // recalculate the state of this cloud according to its new video pixel brightness,
			c.render(); // and finally render its rain drops if there has been some movement since last frame!
		}
		
		popMatrix(); // We're done drawing in 3D, pop back to the previous matrix.
		
	}
}
