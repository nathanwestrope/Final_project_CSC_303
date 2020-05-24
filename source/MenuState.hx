package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxG;


class MenuState extends FlxState
{
   override public function create():Void
   {
      
      
      for (i in 0...15)
      {
         var spr = new Graphics(100, 100);
         add(spr);
      }
   
      for (i in 0...15)
      {
         var spr = new Graphics(0, 0);
         add(spr);
      }
         
      for (i in 0...15)
      {
         var spr = new Graphics(450, 350);
         add(spr);
      }
   
      for (i in 0...15)
      {
         var spr = new Graphics(500, 550);
         add(spr);
      }

      var text = new FlxText(10, 200, 0, "Welcome to hell! How long can you last?", 25, true);
      add(text);
      
      
      var playButton:FlxButton;
      playButton = new FlxButton(0, 0, "Play", clickPlay);
      add(playButton);

      playButton.screenCenter();

      super.create();
   }

   override public function update(elapsed:Float):Void
   {
      super.update(elapsed);
         
   }
   
   function clickPlay()
   {
     FlxG.switchState(new PlayState());
   }
}