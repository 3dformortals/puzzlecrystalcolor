package;

import flixel.FlxG;
import flixel.FlxState;
// import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import flixel.tweens.FlxTween;
// import flixel.tweens.FlxEase;

class PrizeState extends FlxState {
    function bcallback():Void{
        Main.saveall();
        FlxG.switchState(new MenuState());
    }
    
    public override function create():Void {
        super.create();
        var codes:Array<String>=["","371645289", "746392815", "581236974", "241396785", "391824657", "617825934", "586923741", "956283741", "782649531"];
        var b:FlxButton=new FlxButton(0,280,"",bcallback);
        b.loadGraphic("assets/images/menu/big/prize"+Std.string(Main.bigprize)+".png",false);
        add(b);
        var color:FlxColor=FlxColor.fromRGB(30,30,30,255);
        var t:FlxText=new FlxText(0,0,720,codes[Main.bigprize]);
        t.setFormat("assets/data/RobotoMono-Bold.ttf", 40, color);
		t.alignment = RIGHT;
        t.angle=180;
        t.alpha=0;
        FlxTween.tween(t,{alpha:1},10.0,{type:FlxTweenType.ONESHOT});
        t.y=1280-t.height;
        add(t);
    }

    public override function update(elapsed:Float):Void {
        super.update(elapsed);

    }
}