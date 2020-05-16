package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;



 class Fireballs extends FlxSprite
{

     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
     {
        super(X, Y, SimpleGraphic);
        this.makeGraphic(16, 16, FlxColor.RED);
        this.velocity.set(FlxG.random.int(-50, 50), FlxG.random.int(-50, 50));
     }
     override public function update(elapsed:Float):Void
    {
        //this.color = 0xffffff & (((Std.int(this.y) % 255) << 16) + ((Std.int(this.x) % 255) << 8) + ((Std.int(this.x) + Std.int(this.y)) % 255));
        screenWrapping();
        super.update(elapsed);
    }

    function screenWrapping()
        {
         
        if (x > FlxG.width)
        {
            x = 0;
        }
        if (x < 0)
        {
            x = FlxG.width;
        }
        if (y > FlxG.height)
        {
            y = 0;
        }
        if (y < 0)
        {
            y = FlxG.height;
        }
            
            
        }
}