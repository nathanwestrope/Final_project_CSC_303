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

    public function new(timer:Float, levelNum:Int)
    {
        super();
		this.timer = timer;
        this.levelNum = levelNum;
    
    }

    override public function create():Void
    {

        var retryButton:FlxButton;
        retryButton = new FlxButton(0, 0, "Play again?", clickRetry);
        add(retryButton);

        retryButton.screenCenter();


        var exitButton:FlxButton;
        exitButton = new FlxButton(280, 250, "Exit", clickExit);
        add(exitButton);

        var text = new FlxText(100,100, 0, "Level Reached: ", 25, true);
        add(text);

        level = new FlxText(350,100, 0, "-----", 25, true);
        add(level);

        var text1 = new FlxText(100,150, 0, "Time Lasted: ", 25, true);
        add(text1);

        timeOut = new FlxText(305,150, 0, "------" , 25, true);
        add(timeOut);


        var text2 = new FlxText(250,50, 0, "You Died!", 25, true);
        add(text2);


        super.create();
    }

    override public function update(elapsed:Float):Void
    {

    timeOut.text = Std.string(timer);
    level.text = Std.string(levelNum);

    super.update(elapsed);     
    }

    function clickRetry()
    {
        FlxG.switchState(new PlayStateLev1());
    }
    function clickExit()
    {
        FlxG.switchState(new MenuState());
    }
    
}