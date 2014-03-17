package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Sean
 */
class Bullet extends FlxSprite
{

	public function new(X:Int,Y:Int)
	{
		super(X, Y);
		this.loadGraphic("assets/images/bullet.png");
	}
	
}