package;

import flixel.FlxSprite;

class ItemSvet extends FlxSprite {
    
    public var y_row:Int=0; // 0
    public var x_col:Int=0; // 0
    
    /**
     *  Extended FlxSprite with add column and row parameters
     *  @param x_col - column number dx
     *  @param y_row - string number dy inside column
     */
    public function new(x_col:Int, y_row:Int) {
        super();
        this.loadGraphic("assets/images/svet801.png",false,80,80);
        this.alpha=1;
        this.x_col=x_col;
        this.y_row=y_row;
    }
    
    public override function update(elapsed:Float):Void {
        super.update(elapsed);
    }
    
    public override function destroy() {
        super.destroy();
    }
}