package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import openfl.text.TextField;
// import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormatAlign;
import haxe.Http;
import flixel.system.FlxSound;

class StatS extends FlxState {
    var tpoints:FlxText;
    var uname:FlxInputText;
    var muname:TextField;
    var music:FlxSound;
    
    function bmcallback():Void
    {
        Main.saveall();
        // Main.ads.hidebanner();
        FlxG.switchState(new MenuState());
    }
    
    function u_namecounter():String
    {
        #if android
        return muname.text;
        #else
        return uname.text;
        #end
        return "something wrong";
    }
    
    function prizestringmaker():String{
        var x:String="";
        for (i in Main.crystals){
            x+=i?"1":"0";
        }
        return x;
    }
    
    function bracallback():Void
    {
        // var serverlink:String;
        // if (Main.testserver){serverlink="http://127.0.0.1:8000/rating/CrystalColorPuzzle/";}
        // else {serverlink="http://stts.pythonanywhere.com/rating/CrystalColorPuzzle/";}
        
        // var req:Http = new Http(serverlink);
        // req.setParameter("u_id", Main.u_id);
        // req.setParameter("u_key", Main.u_key);
        // req.setParameter( "u_name", u_namecounter() );
        // req.setParameter("u_points", Std.string(Main.points));
        // req.setParameter("appname","SpinnerTimeKillerOverlordPuzzle");
        // req.setParameter("u_prize",prizestringmaker());
        
        // // req.setParameter("u_",);
        // req.request( true );
        
        // // trace(req.responseData);
        // var position:String="?";
        // var s:String=req.responseData;
        // var ss:Array<String>=s.split("_");
        
        
        // if (ss.length==3 && ~/-?[0-9]+/.match(ss[0]) && ~/-?[0-9]+/.match(ss[1]) && ~/-?[0-9]+/.match(ss[2]))
        // {
        //     Main.u_id=ss[0];Main.u_key=ss[1];position=ss[2];
        // }
        
        
        
        
        // Main.saveall();
        // FlxG.openURL(serverlink);
    }
    
    function textstylemaker(t:FlxText,color:FlxColor,tfw:Int):Void
	{
		var fw:Int = 60;
		var style:FlxTextBorderStyle = FlxTextBorderStyle.OUTLINE;
		t.fieldWidth=tfw;
		t.setFormat("assets/data/RobotoMono-Bold.ttf", fw, color);
		t.alignment = CENTER;
		add(t);
	}
    
    function btn_llllcallback():Void
    {
        // FlxG.openURL("https://play.google.com/store/apps/developer?id=llll","_blank");
    }
    
    public override function create():Void {
        super.create();
        // extension.wakeLock.WakeLock.allowScreenTimeout = false;
        // var fon:FlxSprite=new FlxSprite(0,0,"assets/images/fon/fon0.png");
		// add(fon);
        
        var monkeys:FlxSprite=new FlxSprite(0,400,"assets/images/fon/4monkeys.png");
        add(monkeys);
        var luna:FlxSprite=new FlxSprite(364,200,"assets/images/fon/luna160.png");
        add(luna);
        
        //prizeblock
        var pp:Array<Array<Float>>=new Array(); //prize positions
        var dx:Int=80;
        var dy:Int=400+720-8-72;
        pp[1]=[537.729,dy-331.924];
        pp[2]=[86.775,dy-316.415];
        pp[3]=[125.928,dy-316.987];
        pp[4]=[232.008,dy-318.322];
        pp[5]=[266.458,dy-318.831];
        pp[6]=[251.356,dy-375.424];
        pp[7]=[499.975,dy-332.941];
        pp[8]=[519.322,dy-384.576];
        pp[9]=[110,dy-375.169];
        var ap:Array<FlxSprite>=new Array();
        for (i in 1...10){
            ap[i]=new FlxSprite(pp[i][0],pp[i][1],"assets/images/menu/prize"+Std.string(i)+".png");
            if (Main.crystals[i]){
                switch (i){
                    case 6,8,9:true;
                    default:ap[i].scale.scale(0.1);
                }
                add(ap[i]);
            }
        }
        
        var back:FlxSprite=new FlxSprite(330,1160);
        back.loadGraphic("assets/images/menu/back_ani_btn160.png",true,80,80);
        // back.animation.add("loop1",[9,10,11,12,13,14,15,16,17,18,19,0,1,2,3,4,5,6,7,8,9],20,true);
        // back.animation.add("loop2",[29,30,31,32,33,34,35,36,37,38,39,20,21,22,23,24,25,26,27,28,29],20,true);
        // back.animation.add("loop3",[49,50,51,52,53,54,55,56,57,58,59,40,41,42,43,44,45,46,47,48,49],20,true);
        // back.animation.add("loop4",[69,70,71,72,73,74,75,76,77,78,79,60,61,62,63,64,65,66,67,68,69],20,true);
        // back.animation.add("loop6",[109,110,111,112,113,114,115,116,117,118,119,100,101,102,103,104,105,106,107,108,109],20,true);
        // back.animation.add("loop",[9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9],20,true);
        back.animation.add("loop5",[89,90,91,92,93,94,95,96,97,98,99,80,81,82,83,84,85,86,87,88,89],20,true);
        back.animation.play("loop5");
        back.color=FlxColor.fromRGB(0,128,255);
        back.alpha=1;
        add(back);
        
        var btn_back:FlxButton=new FlxButton(290,1120,"",bmcallback);
        btn_back.loadGraphic("assets/images/glass160.png",true,160,160);
        add(btn_back);
        
        var brafon:FlxSprite=new FlxSprite(35,1155);
        brafon.loadGraphic("assets/images/ani_web_fon90.png");
        brafon.color=FlxColor.fromRGB(255,128,0);
        add(brafon);
        var bra:FlxSprite=new FlxSprite(35,1155);
        bra.loadGraphic("assets/images/ani_web.png",true,90,90);
        bra.animation.add("spin",[0,1,2,3,4,5,6,7,8,9],24,true);
        bra.animation.play("spin");
        bra.color=FlxColor.fromRGB(0,128,255);
        bra.alpha=1;
        add(bra);
        var btn_bra:FlxButton=new FlxButton(0,1120,"",bracallback);
        btn_bra.loadGraphic("assets/images/glass160.png");
        add(btn_bra);
        
        tpoints=new FlxText(0,1080,720,Std.string(Main.points).split(".")[0]);
        textstylemaker(tpoints,FlxColor.WHITE,720);
        add(tpoints);
        
        music=FlxG.sound.load("assets/music/tikstats.ogg",0.4,true);
		music.play(true,0,60250);
        
        // namemaker();//textfield depend of android || other
        //broken 20200408 when focus lost apk fail, and cpp textfield freezed after some required recoding
        
        var llll:FlxSprite=new FlxSprite(560,1160);
        llll.loadGraphic("assets/images/ani_llll.png",true,160,80);
        llll.animation.add("tik",[0,1,2,3,2,1,0,4,5,6,5,4],12,true);
        llll.animation.play("tik");
        add(llll);
        
        var btn_llll:FlxButton=new FlxButton(560,1160,"",btn_llllcallback);
        btn_llll.loadGraphic("assets/images/glass.png",false,160,80);
        add(btn_llll);
        
        // Main.ads.showbanner();
    }
    
    function onMobileEnter(e:openfl.events.KeyboardEvent) {
        if (e.keyCode == 13) {
            muname.needsSoftKeyboard = false;
            muname.removeEventListener(openfl.events.KeyboardEvent.KEY_DOWN, onMobileEnter);
            FlxG.removeChild(muname);
        }
        Main.u_name=muname.text;
        Main.saveall();
    }
    
    function namemaker():Void{
        #if mobile
        muname=new TextField();
        muname.x=10;
        muname.y=160;
        muname.type = openfl.text.TextFieldType.INPUT;
        muname.textColor=0x00FFFF;
        muname.border=true;
        muname.borderColor=0x00FFFF;
        muname.background=false;
        muname.backgroundColor=0x000000;
        muname.width=700;
        muname.height=60;
        muname.defaultTextFormat = new openfl.text.TextFormat("assets/data/RobotoMono-Bold.ttf", 32,0x00FFFF,false,false,false,null,null,TextFormatAlign.CENTER);
        muname.needsSoftKeyboard = true;
        muname.addEventListener(openfl.events.KeyboardEvent.KEY_DOWN, onMobileEnter);
        //добавить действие при потере фокуса
        
        muname.maxChars=33;
        muname.text=Main.u_name;
        
        FlxG.addChildBelowMouse(muname);
        // FlxG.stage.focus = muname;
        
        #else
        uname=new FlxInputText(0,160,720,Main.u_name,60,FlxColor.WHITE,FlxColor.BLACK);
        uname.filterMode=3;
        uname.lines=1;
        uname.maxLength=33;
        uname.caretColor=FlxColor.WHITE;
        uname.focusLost=flxinputtextfocuslost;
        add(uname);
        #end
    }
    
    function flxinputtextfocuslost():Void
    {
        Main.u_name=uname.text;
        Main.saveall();
    }
    
    public override function update(elapsed:Float):Void {
        super.update(elapsed);

    }
}