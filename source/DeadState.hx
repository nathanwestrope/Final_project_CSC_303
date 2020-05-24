package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;



class DeadState extends FlxState
{
    var timer:Float;
    var level:FlxText;
    var levelNum:Int = 0;
    var timeOut:FlxText;
    var fireballsgroup:Int;
    var fireballCount:FlxText;

    public function new(timer:Float, levelNum:Int, fireballsgroup:Int)
    {
        super();
		this.timer = timer;
        this.levelNum = levelNum;
        this.fireballsgroup = fireballsgroup;
    }

    override public function create():Void
    {
        var text2 = new FlxText(250,50, 0, "You Died!", 25, true);
        add(text2);

        var retryButton:FlxButton;
        retryButton = new FlxButton(0, 0, "Play again?", clickRetry);
        add(retryButton);

        retryButton.screenCenter();


        var exitButton:FlxButton;
        exitButton = new FlxButton(280, 250, "Exit", clickExit);
        add(exitButton);

        level = new FlxText(100,100, 0, "0", 25, true);
        level.text = "Level Reached:   " + Std.string(levelNum);
        add(level);

        timeOut = new FlxText(100,150, 0, "0" , 25, true);
        timeOut.text ="Time Lasted:   " + Std.string(timer);
        add(timeOut);

        fireballCount = new FlxText(100,200, 0, "0" , 25, true);
        fireballCount.text = "Number of fireballs:   " + Std.string(fireballsgroup);
        add(fireballCount);




        super.create();
    }

    override public function update(elapsed:Float):Void
    {


    super.update(elapsed);     
    }

    function clickRetry()
    {
        FlxG.switchState(new PlayState());
    }
    function clickExit()
    {
        FlxG.switchState(new MenuState());
    }
    
}