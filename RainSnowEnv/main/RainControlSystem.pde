class RainControlSystem
{
  ArrayList<RainDrop> rainDrops;
  EnvType envType;

  RainControlSystem(int num)
  {
    this.rainDrops = new ArrayList<RainDrop>();
    for (int i = 0; i < num; i++)
    {
      rainDrops.add(new RainDrop(new PVector(random(-100, width), random(-10, height), random(5)), new PVector(0, 0)));
    }
    envType = EnvType.RAIN;
  }

  void Update()
  {
    for (RainDrop drop : rainDrops)
    {
      switch(envType){
      case SNOW:
        drop.ApplyForce(new PVector(random(4,5)*noise(millis()),0));
        break;
      case RAIN:
        drop.ApplyForce(new PVector(random(1,2)*noise(millis()),0));
        break;
      }
      drop.update();
      drop.show();
    }
  }

  void ChangeSpdMultiplier(float target)
  {
    for (RainDrop drop : rainDrops)
    {
      drop.velocityMultiplier = target;
    }
  }

  void ChangeDropColor(color newCol)
  {
    for (RainDrop drop : rainDrops)
    {
      drop.dropColor = newCol;
    }
  }

  void ApplyForce(PVector force)
  {
    for (RainDrop drop : rainDrops)
    {
      drop.ApplyForce(force);
    }
  }

  void DetectSlowField(PVector center, float radius)
  {
    for (RainDrop drop : rainDrops)
    {
      if (PVector.sub(center, drop.location).mag() < radius)
      {
        drop.velocityMultiplier = 0.1f;
      } else
      {
        drop.velocityMultiplier = 1.0f;
      }
    }
  }

  void DropSnow()
  {
    envType = EnvType.SNOW;
    for (RainDrop drop : rainDrops)
    {
      drop.dropColor = color(0, 0, 60, 100);
      drop.sizeMax = 10;
      drop.sizeMin = 5;
      drop.velMax = 6;
      drop.velMin = 2;
    }
    print(envType);
  }

  void DropRain()
  {
    envType = EnvType.RAIN;
    for (RainDrop drop : rainDrops)
    {
      drop.dropColor = color(0, 0, 60, 255);
      drop.sizeMax = 5;
      drop.sizeMin = 2;
      drop.velMax = 15;
      drop.velMin = 8;
    }
    print(envType);
  }
  
}

public enum EnvType {
  RAIN,
  SNOW;
} 
