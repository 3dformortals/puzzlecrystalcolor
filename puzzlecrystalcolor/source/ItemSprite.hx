package;

import flixel.FlxSprite;

class ItemSprite extends FlxSprite {
    
    var ck:ColorKeeper=new ColorKeeper();
    public var y_row:Int=0; // 0
    public var x_col:Int=0; // 0
    /**
     *  color number for ColorKeeper 0...8
     */
    public var cn:Int=0;
    
    function updatecolor():Void
    {
        this.color=switch (this.cn) {
            case 0:ck.c0;
            case 1:ck.c1;
            case 2:ck.c2;
            case 3:ck.c3;
            case 4:ck.c4;
            case 5:ck.c5;
            case 6:ck.c6;
            case 7:ck.c7;
            case 8:ck.c8;
            default:ck.c0;
        }
        if (this.cn==0){this.alpha=0.23;}
    }
    
    function cnumbercounter():Void
    {
        this.cn=1;
        // var ran:FlxRandom=new FlxRandom();
        // this.cn=ran.int(0,7);
        this.updatecolor();
    }
    
    public function anistop():Void
    {
        this.animation.stop();
    }
    
    /**
     *  Extended FlxSprite with add column and string parameters
     *  @param x_col - column number dx
     *  @param y_row - string number dy inside column
     */
    public function new(x_col:Int, y_row:Int) {
        super();
        this.loadGraphic("assets/images/item801.png",false,80,80);
        this.x_col=x_col;
        this.y_row=y_row;
        this.cnumbercounter();
    }
    
    public override function update(elapsed:Float):Void {
        super.update(elapsed);
    }
    
    public override function destroy() {
        super.destroy();
    }
}