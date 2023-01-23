package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {
	final SPEED:Int = 150;


	public function new(xPos:Int=0, yPos:Int=0) {
		super(xPos, yPos);
		loadGraphic("assets/images/spritesheet.png", true, 384, 632);
		drag.x = SPEED * 4;
		animation.add("walk", [0, 1, 2, 3, 4, 5], 12);
		animation.add("idle", [5], 12, false);

		// determine which direction player is facing
		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);

	}

	public function movement() {
		final left = FlxG.keys.anyPressed([LEFT, A]);
		final right = FlxG.keys.anyPressed([RIGHT, D]);

		// play walking animation if keys are being pressed
		// otherwise, stay as idle animation
		if (left || right) {
			animation.play("walk");
		}
		else {
			animation.play("idle");
		}


		// if right, set positive velocity
		// if left, negative velocity (moving left)
		// otherwise (both being pressed), no velocity
		if (left && right) {
			velocity.x = 0;
		}
		else if (right) {
			velocity.x = SPEED;
			facing = RIGHT;
		} 
		else if (left) {
			velocity.x = -SPEED;
			facing = LEFT;
		}

		// ensure player doesn't walk off screen
		if (this.x <= 0) {
			this.x = 0;
		}
		if (this.x >= FlxG.width-this.width)
			this.x = FlxG.width-this.width;


	}

	override function update(elapsed: Float) {
		super.update(elapsed);
		movement();
	}

}