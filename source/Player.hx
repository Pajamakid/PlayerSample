package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author Sean
 */
class Player extends FlxSprite
{	
	private var runSpeed:Int = 100;
	private var bulletTimer:Int = 0;
	private var state:MenuState;
	
	public function new(state:MenuState)
	{	
		//Sets initial sprite image and position
		var centerX:Int = Math.floor((FlxG.width / 2)-16);
		var centerY:Int = Math.floor((FlxG.height / 2)-32);
		super(centerX, centerY);
		this.loadGraphic("assets/images/wizard_right.png");
		
		this.state = state;
		this.state.add(this);
	}	
	
	override public function update():Void
	{
		
		maxVelocity.set(runSpeed, runSpeed);
		
		//Movement Controls; loads sprite and sets velocity to runSpeed.
		//Sprite keeps inital orientation and stops if opposite direction keys are held down.
		if (FlxG.keys.anyPressed(["W"]))
		{
			if (FlxG.keys.anyPressed(["S"]))
			{
				this.velocity.y = 0;
			}
			else
			{
				this.velocity.y = -runSpeed;
				this.loadGraphic("assets/images/wizard_up.png");
			}
		}
		if (FlxG.keys.anyPressed(["S"]))
		{
			if (FlxG.keys.anyPressed(["W"]))
			{
				this.velocity.y = 0;
			}
			else
			{
				this.loadGraphic("assets/images/wizard_down.png");
				this.velocity.y = runSpeed;
			}
		}
		if (FlxG.keys.anyPressed(["A"]))
		{
			if (FlxG.keys.anyPressed(["D"]))
			{
				this.velocity.x = 0;
			}
			else
			{
				this.loadGraphic("assets/images/wizard_left.png");
				this.velocity.x = -runSpeed;
			}
		}
		if (FlxG.keys.anyPressed(["D"]))
		{
			if (FlxG.keys.anyPressed(["A"]))
			{
				this.velocity.x = 0;
			}
			else 
			{
			this.loadGraphic("assets/images/wizard_right.png");
			this.velocity.x = runSpeed;	
			}
		}
		
		//Resets velocity when movement key is released
		if (FlxG.keys.anyJustReleased(["W","S"]))
		{
			this.velocity.y = 0;
		}
		if (FlxG.keys.anyJustReleased(["A","D"]))
		{
			this.velocity.x = 0;
		}		
		super.update();
	}
	
	public function fire() {
		
		var bullet:Bullet = new Bullet();
		bullet.x = this.x;
		bullet.y = this.y;
		
		this.state.add(bullet);
	}
}