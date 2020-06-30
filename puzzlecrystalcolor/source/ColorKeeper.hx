package;

import flixel.util.FlxColor;

class ColorKeeper {
    /**
     *  c0-white transperent close to half
     */
    public var c0:FlxColor;
    /**
     *  c1-red
     */
    public var c1:FlxColor;
    /**
     *  c2-orange
     */
    public var c2:FlxColor;
    /**
     *  c3-yellow
     */
    public var c3:FlxColor;
    /**
     *  c4-green
     */
    public var c4:FlxColor;
    /**
     *  c5-Cyan
     */
    public var c5:FlxColor;
    /**
     *  c6-blue
     */
    public var c6:FlxColor;
    /**
     *  c7-magenta
     */
    public var c7:FlxColor;
    /**
     *  c8-black
     */
    public var c8:FlxColor;
    
    /**
     *  color from number 0...8 white,x7 rainbow, black
     *  @param n - number of color
     *  @return FlxColor
     */
    public function c(n:Int):FlxColor{
        var c:FlxColor=switch(n){
            case 0:c0;
            case 1:c1;
            case 2:c2;
            case 3:c3;
            case 4:c4;
            case 5:c5;
            case 6:c6;
            case 7:c7;
            case 8:c8;
            default:c0;
        }
        return c;
    }
    
    /**
     *  next color number in rainbow direction or loop
     *  @param n - color number inside ColorKeeper
     *  @param lim - color number limit 1...7
     *  @return Int
     */
    public function ncn(n:Int,?lim:Int=7):Int {
        lim=(lim>7 || lim<0) ? 7:lim;
        n=(n<lim) ? (n+1):0;
        // if (n<lim){n+=1;}
        // else{n=0;}
        return n;
    }
    
    public function new() {
        c0=FlxColor.fromRGB(255,255,255,60);
        c1=FlxColor.fromRGB(255,0,0,255);
        c2=FlxColor.fromRGB(255,128,0,255);
        c3=FlxColor.fromRGB(255,255,0,255);
        c4=FlxColor.fromRGB(0,255,0,255);
        c5=FlxColor.fromRGB(0,255,255,255);
        c6=FlxColor.fromRGB(0,128,255,255);
        c7=FlxColor.fromRGB(255,0,255,255);
        c8=FlxColor.fromRGB(0,0,0,255);
    }
}