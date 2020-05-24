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


class PlayState extends FlxState
{
	var fireballsgroup = new FlxTypedGroup<Fireball>();
	var fireballs:Fireball;
	var player:Player;
	var timeCount:Float;
	var background1 = new FlxSprite();//actual background
	var background = new FlxSprite();//background of top bar
	var time:FlxText;
	var titleText:FlxText;
	//var level:FlxText;
	var levelNum:Int;
	var levelTime:Float;
	var levelLable:FlxText;
	var timeRound:Float;
	var fireballCount:Int = 15;
	var graceCount:Float;
	var fireballCounterLable:FlxText;
	var color:FlxColor;


	override public function create():Void
	{
		graceCount = 5;
		timeCount = 0;
		levelNum = 1;
		levelTime = 30;

		randomColor();

		background1.makeGraphic(FlxG.width, FlxG.height, color);
		add(background1);

		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		add(background);

		time = new FlxText(0, 2, 0, "0", 8);
		time.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(time);
		

		
		levelLable = new FlxText(250, 2, 0, "Level: ", 8);
		levelLable.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(levelLable);


		titleText = new FlxText(0, 0, 0, "Welcome to hell! Now Run!", 25, true);
		titleText.setBorderStyle(SHADOW, FlxColor.BLACK, 1, 1);
		titleText.screenCenter();
		add(titleText);

		fireballCounterLable = new FlxText(510, 2, 0, "0", 8);
		add(fireballCounterLable);

		player = new Player(20, 20);
		add(player);

		addFireballs();
	
	
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		levelLable.text = "Level: " + Std.string(levelNum);
		fireballCounterLable.text = "Number of Fireballs:  " + Std.string(fireballsgroup.length);

		timeCount = timeCount + elapsed;
		timeRound = (Math.round(timeCount*100) / 100);
		time.text = "Time: " + Std.string(timeRound);

		if (timeCount > levelTime)
		{
			levelUp();
		}

		if(timeCount > graceCount)
		{	
			remove(titleText);
	    	FlxG.overlap(player, fireballsgroup, collisionAction);
		}
			
		super.update(elapsed);

	}
	function collisionAction(player:Player, fireballs:Fireball)
	{
		FlxG.switchState(new DeadState(timeRound, levelNum, fireballsgroup.length));
	}
	function addFireballs()
	{
		for (i in 0...fireballCount)
			{
				fireballs = new Fireball(FlxG.random.int(-200, 200), FlxG.random.int(-400, 400));
				fireballsgroup.add(fireballs);
			}
			add(fireballsgroup);	
	}
	
	function levelUp()
	{

		levelNum = levelNum + 1;
		levelTime = Math.round(timeCount) + 30;
		graceCount = Math.round(timeCount) + 5;

		randomColor();

		titleText.text = "Level: " + Std.string(levelNum);
		titleText.screenCenter();
		add(titleText);

		addFireballs();
		
	}
	function randomColor()
	{
		color = FlxColor.fromRGB(FlxG.random.int(0, 255),FlxG.random.int(0, 255),FlxG.random.int(0, 255));
	}		
}
