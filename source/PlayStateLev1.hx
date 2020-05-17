package;

import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxCollision;
import flixel.FlxG;
import flixel.util.FlxTimer;
import haxe.display.Protocol.HaxeResponseErrorData;
import flixel.text.FlxText;
import flixel.FlxState;


class PlayStateLev1 extends FlxState
{
	var fireballsgroup = new FlxTypedGroup<Fireballs>(10);
	var player:Player;
	var timer:Float = 0;
	

	override public function create():Void
	{
		

		for (i in 0...10)
		{
			var fireballs = new Fireballs(FlxG.random.int(-200, 200), FlxG.random.int(-400, 400));
			add(fireballs);
			fireballsgroup.add(fireballs);
		}

		player = new Player(20, 20);
		add(player);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		timer = timer + elapsed;

		if (timer > 60)
		{
			trace("next level");
		}

		FlxG.overlap(player, fireballsgroup, collisionAction);
			
		super.update(elapsed);

	}
	function collisionAction(player:Player, fireballs:Fireballs )
	{
		
		FlxG.switchState(new DeadState());
			
	}
	
		
			
		
	
}
