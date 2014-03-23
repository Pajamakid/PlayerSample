package;

import flash.geom.Point;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.util.FlxAngle;

/**
 * ...
 * @author Sean
 */
class Bullet extends FlxSprite
{		
	
	var bulletSpeed:Int = 500;
	
	public function new(playerX:Int,playerY:Int,mouseX:Int,mouseY:Int)
	{
		//Finds the angle between the player and mouse pointer positions
		var playerPoint = new FlxPoint(playerX,playerY);
		var mousePoint = new FlxPoint(mouseX, mouseY);
		var shootAngle:Float = FlxAngle.getAngle(playerPoint, mousePoint) - 90;
		
		//Sets initial position of bullet sprite at player's current postion.
		//Rotates bullet sprite and gives appropriate velocity components to aim towards mouse pointer. 
		super(playerX,playerY);
		this.loadGraphic("assets/images/bullet.png");
		this.angle = shootAngle;
		this.velocity.x = bulletSpeed * Math.cos(shootAngle*Math.PI/180);
		this.velocity.y = bulletSpeed * Math.sin(shootAngle*Math.PI/180);
		
	}
	
	override public function update()
	{
		//Kills bullet
		super.update();
	}
}