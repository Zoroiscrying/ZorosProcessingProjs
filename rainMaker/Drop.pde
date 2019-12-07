// This is the Drop class.
// It is meant to be called from the Cloud class to generate a rain drop.

class Drop
{
	// PVector is a class that contains 2 to 3 floats plus a number of convenient
	// vector math operations. It's very useful to handle positions, speed, acceleration.
	// Most movement-oriented sketches use this, instead of dealing with x,y,z raw positions.
	PVector position, velocity, startpos, endpos;
	float lifespan;
	float age;
	float remaining;
	boolean deadFlag;
	int traillength;
	PVector[] trail;
	int radius;
	
	Drop(PVector _startpos, PVector _endpos, float _lifespan)
	{
		// The "this" word is used to help differenciate the object's variable from the argument
		// passed to the constructor. It is not mandatory though, and that's why I'm dropping it
		// elsewhere. Don't hesitate to use it if it makes you feel more comfy.
		this.startpos = _startpos;
		this.endpos = _endpos;
		this.lifespan = _lifespan;
		this.age = 0;
		this.remaining = 1.0 - age/(float)lifespan;
		this.deadFlag = false;
		this.position = this.startpos.get();
		this.velocity = PVector.div( PVector.sub(this.endpos,this.startpos), lifespan/2.0 );
		this.traillength = (int)(this.lifespan/2.0f);
		this.trail = new PVector[this.traillength];
	    for( int i=0; i<this.traillength; i++ )
		{
	    	this.trail[i] = new PVector( this.startpos.x, this.startpos.y, this.startpos.z );
	    }
		this.radius = 2;
	}
	
	void update()
	{
		age++;
		
		// kill if age has reached the limit
		if (age > lifespan) {
			die();
			return;
		}
		
        // When spawned, the remaining param is 1.0.
        // When death occurs, the remaining param is 0.0.
        remaining = 1.0 - age/(float)lifespan;
		
	    // Every frame, the current location will be passed on to
	    // the next element in the location array. Think 'cursor trail effect'.
	    for( int i=traillength-1; i>0; i-- ) {
	      trail[i].set( trail[i-1] );
	    }
		
	    // Set the initial location.
	    // trail[0] represents the current position of the drop.
		position.add(velocity);
		trail[0].set( position );
	}
	
	void die()
	{
		deadFlag = true;
	}
	
	boolean isDead()
	{
		if (deadFlag) return true;
		else return false;
	}
	
	void render()
	{
		noStroke();
		color c = color( 0/255.0, 162/255.0, 255/255.0 );
		fill(c);
		pushMatrix();
		translate(position.x, position.y, position.z);
		// Uncomment the following line to see the drops themselves as circles:
		// ellipse(0, 0, radius, radius);
		popMatrix();
		
		// The actual thing that we see on screen: the rain drop's trail.
		this.renderTrail();
	}
	
	void renderTrail() {
		float xp, yp, zp;
		float xOff, yOff, zOff;
		// The following is some advanced, down to the vertex drawing.
		// Check out the Processing reference for vertex(), you can do TRIANGLE_STRIPs
		// and other. All of Processing's primitive shapes are drawn using this kind
		// of operations.
		beginShape(QUAD_STRIP);
		for ( int i=0; i<traillength - 1; i++ )
		{
			PVector currentVec = new PVector( trail[i].x, trail[i].y, trail[i].z );
			float per          = 1.0 - (float)i/(float)(traillength-1);
			xp                 = trail[i].x;
			yp                 = trail[i].y;
			zp                 = trail[i].z;

			// The following is vector math. Niahahahahaha.
			// We use this to generate the rain drop's trail that grow and move in the right direction.
			// This is mostly copy/pasted from Robert Hodgin's work. Awesome stuff really.
			if ( i < traillength - 2 )
			{
	  	          PVector perp0 = PVector.sub(trail[i], trail[i+1]);
	  	          PVector perp1 = perp0.cross( new PVector( 0, 0, 1 ) );
				  perp1.normalize();
	  	          PVector perp2 = perp0.cross( perp1 );
				  perp2.normalize();
	  	          perp1 = perp0.cross( perp2 );
				  perp1.normalize();
			  
	  	          xOff        = perp1.x * remaining * per * radius;
	  	          yOff        = perp1.y * remaining * per * radius;
	  	          zOff        = perp1.z * remaining * per * radius;
			  
	  	          fill( 1.0 - per, per*.4, per, per * .5 );
	  	          noStroke();
	  	          vertex( xp - xOff, yp - yOff, zp - zOff );
	  	          vertex( xp + xOff, yp + yOff, zp + zOff );
		  }
      }
      endShape();
    }
	
}