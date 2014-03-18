package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Sean
 */
class Bullet extends FlxSprite
{	
	public function new()
	{
		super();
		this.loadGraphic("assets/images/bullet.png");
	}
	
	override public function update():Void
	{
		
	}
}