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
	var fireballsgroup = new FlxTypedGroup<Fireballs>(15);
	var player:Player;
	var timeCount:Float;
	var background1 = new FlxSprite();//actual background
	var background = new FlxSprite();//background of top bar
	var time:FlxText;
	var titleText:FlxText;
	var level:FlxText;
	var levelNum:Int = 1;
	var levelLable:FlxText;
	

	override public function create():Void
	{
		timeCount = 0;

		background1.makeGraphic(FlxG.width, FlxG.height, FlxColor.YELLOW);
		add(background1);

		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		add(background);

		time = new FlxText(60, 2, 0, "0", 8);
		time.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		var timeLable = new FlxText(0, 2, "Time: ", 8);
		timeLable.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(time);
		add(timeLable);


		levelLable = new FlxText(250, 2, 0, "Level: ", 8);
		levelLable.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(levelLable);

		level = new FlxText(280, 2, 0, Std.string(levelNum), 8);
		level.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(level);
		

		titleText = new FlxText(0, 0, 0, "Welcome to hell! Now Run!", 25, true);
		titleText.setBorderStyle(SHADOW, FlxColor.BLACK, 1, 1);
      	add(titleText);
		titleText.screenCenter();
		

		player = new Player(20, 20);
		add(player);


		for (i in 0...15)
		{
			var fireballs = new Fireballs(FlxG.random.int(-200, 200), FlxG.random.int(-400, 400));
			add(fireballs);
			fireballsgroup.add(fireballs);
		}

	
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		

		timeCount = timeCount + elapsed;
		time.text = Std.string(timeCount);

		if (timeCount >= 30)
		{
			FlxG.switchState(new PlayStateLev2(timeCount, levelNum, player));
		}

		if(timeCount <= 5 )
		{
			
		}
		else
		{
			remove(titleText);
	    	FlxG.overlap(player, fireballsgroup, collisionAction);
		}
			
		super.update(elapsed);

	}
	function collisionAction(player:Player, fireballs:Fireballs )
	{
		FlxG.switchState(new DeadState(timeCount, levelNum));
	}
	
		
			
}
