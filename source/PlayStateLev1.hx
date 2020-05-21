package;

import haxe.Timer;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxCollision;
import flixel.FlxG;
import flixel.util.FlxTimer;
import haxe.display.Protocol.HaxeResponseErrorData;
import flixel.text.FlxText;
import flixel.FlxState;

using flixel.util.FlxSpriteUtil;

class PlayStateLev1 extends FlxState
{
	var fireballsgroup = new FlxTypedGroup<Fireballs>(10);
	var player:Player;
	var timer:Float = 0;
	var background1 = new FlxSprite();
	var background = new FlxSprite();
	var time:FlxText;
	var timeLable:FlxText;
	var text:FlxText;

	override public function create():Void
	{
		background1.makeGraphic(FlxG.width, FlxG.height, FlxColor.YELLOW);
		add(background1);

		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		add(background);

		time = new FlxText(60, 2, 0, "0", 8);
		time.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		timeLable = new FlxText(0, 2, "Time: " ,8);
		
		text = new FlxText(100, 200, 0, "Welcome to hell! Now Run!", 25, true);
		text.setBorderStyle(SHADOW, FlxColor.BLACK, 1, 1);
      	add(text);
		
		add(time);
		add(timeLable);

		player = new Player(20, 20);
		add(player);


		for (i in 0...10)
		{
			var fireballs = new Fireballs(FlxG.random.int(-200, 200), FlxG.random.int(-400, 400));
			add(fireballs);
			fireballsgroup.add(fireballs);
		}

	
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		timer = timer + elapsed;
		time.text = Std.string(timer);

		if (timer > 60)
		{
			trace("next level");
		}

		if(timer < 5 )
		{
			
		}
		else
		{
			remove(text);
	    	FlxG.overlap(player, fireballsgroup, collisionAction);
		}
			
		super.update(elapsed);

	}
	function collisionAction(player:Player, fireballs:Fireballs )
	{
		
		FlxG.switchState(new DeadState());
			
	}
	
		
			
		
	
}
