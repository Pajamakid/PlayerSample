package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var bulletTimer:Int = 0;
	var player:Player;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		player = new Player(this);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		bulletTimer = bulletTimer + 1;
		if (FlxG.mouse.pressed)
		{
			if (bulletTimer >= 10)
			{
				player.fire();
				bulletTimer = 0;
			}
		}
		super.update();
	}	
}