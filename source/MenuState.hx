package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.FlxG;


class MenuState extends FlxState
{
   override public function create():Void
   {
      var playButton:FlxButton;
      playButton = new FlxButton(0, 0, "Play", clickPlay);
      add(playButton);

      playButton.screenCenter();
      
      var text = new FlxText(100, 200, 0, "Welcome to hell! Now Run!", 25, true);
		add(text);
      for (i in 0...15)
      {
         var spr = new Hero(100, 100);
         add(spr);
      }
   
      for (i in 0...15)
      {
         var spr = new Hero(0, 0);
         add(spr);
      }
         
      for (i in 0...15)
      {
         var spr = new Hero(450, 350);
         add(spr);
      }
   
      for (i in 0...15)
      {
         var spr = new Hero(500, 550);
         add(spr);
      }
      
	
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