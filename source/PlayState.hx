package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer.FlxTimerManager;
import haxe.display.Protocol.HaxeResponseErrorData;
import flixel.text.FlxText;
import flixel.FlxState;


class PlayState extends FlxState
{
	var player:Player;

	override public function create():Void
	{
		
		player = new Player(20, 20);
		add(player);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);
	}
	
}
