package;

import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState
{

	var player:Player;
	var ground:FlxSprite;

	override public function create()
	{

		super.create();

		// set background color
		this.bgColor = FlxColor.CYAN;

		// add player
		player = new Player();
		add(player);

		// add ground
		ground = new FlxSprite(0, 620);
		ground.loadGraphic("assets/images/grass.png", false, FlxG.width, FlxG.height-600);
		add(ground);

		// add text
		var text = new FlxText("Move Right: D/Right Arrow Key
							Move Left:  A/Left Arrow Key", 15);
		add(text);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
