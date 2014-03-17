package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Sean
 */
class Player extends FlxSprite
{	
	
	private var runSpeed:Int = 100;
	
	public function new()
	{	
		//Sets initial sprite image and position
		var centerX:Int = Math.floor((FlxG.width / 2)-16);
		var centerY:Int = Math.floor((FlxG.height / 2)-32);
		super(centerX, centerY);
		this.loadGraphic("assets/images/wizard_right.png");
	}	
	
	override public function update():Void
	{
		
		maxVelocity.set(runSpeed, runSpeed);
		
		//Movement Controls; loads sprite and sets velocity to runSpeed.
		if (FlxG.keys.anyPressed(["W"]))
		{
			this.loadGraphic("assets/images/wizard_up.png");
			this.velocity.y = -runSpeed;
		}
		if (FlxG.keys.anyPressed(["S"]))
		{
			this.loadGraphic("assets/images/wizard_down.png");
			this.velocity.y = runSpeed;
		}
		if (FlxG.keys.anyPressed(["A"]))
		{
			this.loadGraphic("assets/images/wizard_left.png");
			this.velocity.x = -runSpeed;
		}
		if (FlxG.keys.anyPressed(["D"]))
		{
			this.loadGraphic("assets/images/wizard_right.png");
			this.velocity.x = runSpeed;
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
}