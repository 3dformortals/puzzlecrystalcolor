package;

import flixel.ui.FlxButton;

class ItemButton extends FlxButton {
    public var x_col:Int=0;
    public var y_row:Int=0;
    
    /**
     *  Extended FlxButton with add column and string parameters.
     *  @param x_col - column number dx
     *  @param y_row - string number dy inside column
     *  @param x - same as standart FlxButton
     *  @param y - same as standart FlxButton
     *  @param text - same as standart FlxButton
     *  @param onClick - same as standart FlxButton
     */
    public function new(x_col:Int, y_row:Int, x:Float, y:Float, text:String, onClick:Void->Void) {
        super(x,y,text,onClick);
        loadGraphic("assets/images/glass80.png");
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