package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;



class DeadState extends FlxState
{


    override public function create():Void
    {

        var retryButton:FlxButton;
        retryButton = new FlxButton(0, 0, "Play again?", clickRetry);
        add(retryButton);

        retryButton.screenCenter();

        var text = new FlxText(100, 200, 0, "you died", 25, true);
        add(text);

        super.create();
    }

    override public function update(elapsed:Float):Void
    {
    super.update(elapsed);     
    }

    function clickRetry()
    {
        FlxG.switchState(new PlayStateLev1());
    }
}