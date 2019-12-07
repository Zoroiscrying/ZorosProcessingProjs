// This the Cloud class.
// This is meant to be created according to the movement detected in video pixels,
// and to generate rain drops (via the Drop class) consequently.

class Cloud
{
	int id;
	PVector position;
	ArrayList<Drop> drops;
	float previousVideoPixelBrightness;
	
	Cloud(int _id, PVector _position)
	{
		// The "this" word is used to help differenciate the object's variable from the argument
		// passed to the constructor. It is not mandatory though, and that's why I'm dropping it
		// elsewhere. Don't hesitate to use it if it makes you feel more comfy.
		this.id = _id;
		this.position = _position;
		this.drops = new ArrayList();
		this.previousVideoPixelBrightness = 0;
	}

	void update(float _newVideoPixelBrightness) // passing the new greyness of the associated video pixel
	{
		// Generate drop in a certain direction when strength of cloud is high enough
		// the strength of the movement is calculated by using the difference
		// between the new pixel brightness this cloud associated and the previous one.
		float strength = abs( previousVideoPixelBrightness - _newVideoPixelBrightness );
		
		// We're comparing this newly calculated strength with the sensitivity we've 
		// defined in the sketch's setup() method.
		if ( strength >= sensitivityInverse )
		{
			// There has been some movement on this video pixel, generate a new rain drop
			// and add it to this cloud's ArrayList of drops.
			drops.add(
						new Drop(
									this.position.get(), // start position of the rain drop
									PVector.add( this.position.get(), new PVector( random(-25,25), random(5,300), random(-25,25) ) ), // end, death position
									random(15, 20) // life span of the rain drop
								)
						);
			// For next round of tests, save the new brightness.
			// What was once new not very long ago is already old. Damned World of frivolous variable users.
			previousVideoPixelBrightness = _newVideoPixelBrightness;
		}
		
		// Update drops and test if they're dead (as in "visually gone"):
		// if so, remove them from the drops ArrayList to save up some RAM.
		// This is crucial if you want your sketch to keep running for
		// a while. The RAM gets cluttered very quickly with this sort of sketch
		// if you don't collect the garbage.
		for (int i=0; i<drops.size(); i++)
		{
			Drop d = drops.get(i);
			d.update();
			if (d.isDead()) drops.remove(i);
		}
	}
	
	void render() // this is called to draw the rain drops contained in this cloud, the cloud itself is not drawn
	{
		for (int i=0; i<drops.size(); i++) {
			Drop d = drops.get(i);
			d.render();
		}
	}
}