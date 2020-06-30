package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var gong:FlxSound;
	var good:FlxSound;
	var music1:FlxSound;
	var music2:FlxSound;
	var cantouch:Bool = false;
	var ck:ColorKeeper = new ColorKeeper();
	/**
	 *  number of mixes will be used for mix. Will be descreased -1 each step
	 */
	var mixcounter:Int=Main.mixlevel*7;
	var mixtimer:FlxTimer = new FlxTimer();
	var ran:FlxRandom = new FlxRandom();
	
	var t1:FlxText = new FlxText();
	
	var xold:Int=90; // значение предыдущего выбора
	var sum:Int=0; // общее число выборов
	var nice:Int=0; // правильное число выборов
	var bad:Int=0; // неправильное число выборов
	
	var baxy:Array<Array<ItemButton>>=new Array();
	function baxycallback(x_col:Int,y_row:Int):Void
	{
		if (cantouch){
			cantouch=false;
			
			stampcounter(x_col,y_row);
			// trace(resultcounter());
			if (resultcounter()){
				// trace(resultcounter());
				if (Main.colorlevel>Main.colorlevelcomplete && Main.colorlevelcomplete<7){Main.colorlevelcomplete+=1;}
				if (Main.stamplevel>Main.stamplevelcomplete && Main.stamplevelcomplete<7){Main.stamplevelcomplete+=1;}
				if (Main.mixlevel>Main.mixlevelcomplete && Main.mixlevelcomplete<7){Main.mixlevelcomplete+=1;}
				var a:Int=Main.colorlevel; var b:Int=Main.stamplevel; var c:Int=Main.mixlevel;
				Main.points+=84*a*b*c;
				var d:Int;
				function abcd(a:Int,b:Int,c:Int,d:Int):Bool{
					if (a>=d && b>=d && c>=d) return true;
					return false;}
				
				d=1; //prize 1...3
				if (abcd(a,b,c,d)){
					if (!Main.crystals[d]){Main.crystals[d]=true;}
					else if (!Main.crystals[d+1]){Main.crystals[d+1]=true;}
					else if (!Main.crystals[d+2]){Main.crystals[d+2]=true;}
				}
				//prize 4...9
				if (Main.crystals[1] && Main.crystals[2] && Main.crystals[3]){
					d=FlxMath.minInt(a,FlxMath.minInt(b,c));
					if (d>1 && !Main.crystals[d+2]){
						if (a==b && b==c) {Main.crystals[d+2]=true;}
					}
				}
				
				good.play();
				Main.saveall();
				mixtimer.start(4,function(t:FlxTimer):Void{FlxG.switchState(new MenuState());});
			}else{cantouch=true;}
		}
	}
	var saxy:Array<Array<ItemSprite>>=new Array(); //item
	var svaxy:Array<Array<ItemSvet>>=new Array(); //item svet
	function axycounter():Void{
		//first column dx , then second string dy
		var x0:Int=80;
		var y0:Int=160;
		var box:Int=80;
		var dx:Int=0;
		var dy:Int=0;
		for (x_col in 1...8){
			saxy[x_col]=new Array();
			svaxy[x_col]=new Array();
			baxy[x_col]=new Array();
			for (y_row in 1...13){
				dx=box*(x_col-1);dy=box*(y_row-1);
				var s:ItemSprite=new ItemSprite(x_col,y_row);
				var sv:ItemSvet=new ItemSvet(x_col,y_row);
				var b:ItemButton=new ItemButton(x_col,y_row,0,0,"",function():Void{baxycallback(x_col,y_row);});
				
				s.x=x0+dx;s.y=y0+dy;
				sv.x=x0+dx;sv.y=y0+dy;
				b.x=x0+dx;b.y=y0+dy;
				saxy[x_col][y_row]=s;
				svaxy[x_col][y_row]=sv;
				baxy[x_col][y_row]=b;
				add(saxy[x_col][y_row]);
				add(svaxy[x_col][y_row]);
				add(baxy[x_col][y_row]);
			}
		}
	}
	
	function newcolortween(x_col:Int, y_row:Int):Void{
		var s:FlxSprite=saxy[x_col][y_row];
		var oldcolor:FlxColor=ck.c(saxy[x_col][y_row].cn);
		var ncn:Int=ck.ncn(saxy[x_col][y_row].cn,Main.colorlevel);
		saxy[x_col][y_row].cn=ncn;
		var newcolor:FlxColor=ck.c(ncn);
		var duration:Float=0.25;
		FlxTween.color(s, duration, oldcolor, newcolor ,{type:FlxTweenType.ONESHOT} );
		
	}
	
	function stampcounter(x_col:Int, y_row:Int):Void{
		var stamp:Array<Array<Int>>;
		stamp=switch(Main.stamplevel){
			case 2:[[x_col+1,y_row-1],[x_col,y_row-1],[x_col-1,y_row-1],[x_col+1,y_row],[x_col-1,y_row],[x_col+1,y_row+1],[x_col,y_row+1],[x_col-1,y_row+1]];
			case 3:[[x_col,y_row],[x_col+1,y_row-1],[x_col-1,y_row+1]];
			case 4:[[x_col+1,y_row-1],[x_col-1,y_row-1],[x_col-1,y_row+1],[x_col+1,y_row+1]];
			case 5:[[x_col,y_row],[x_col+1,y_row-1],[x_col-1,y_row-1],[x_col-1,y_row+1],[x_col+1,y_row+1]];
			case 6:[[x_col+2,y_row-2],[x_col-2,y_row-2],[x_col-2,y_row+2],[x_col+2,y_row+2],[x_col+2,y_row-1],[x_col+1,y_row-2],[x_col-1,y_row-2],[x_col-2,y_row-1],[x_col-2,y_row+1],[x_col-1,y_row+2],[x_col+1,y_row+2],[x_col+2,y_row+1]];
			case 7:[[x_col,y_row],[x_col+2,y_row-2],[x_col-2,y_row-2],[x_col-2,y_row+2],[x_col+2,y_row+2],[x_col+2,y_row-1],[x_col+1,y_row-2],[x_col-1,y_row-2],[x_col-2,y_row-1],[x_col-2,y_row+1],[x_col-1,y_row+2],[x_col+1,y_row+2],[x_col+2,y_row+1]];
			default:[[x_col,y_row]];
		}
		var x:Int=0;var y:Int=0;
		for (i in 0...stamp.length){
			x=stamp[i][0];y=stamp[i][1];
			if (x>0 && x<8 && y>0 && y<13){
				newcolortween(x, y);
			}
		}
	}
	function mixmaker():Void{
		if(mixcounter>0){
			mixcounter-=1;
			var x:Int=ran.int(1,7);
			var y:Int=ran.int(1,12);
			stampcounter(x,y);
			mixtimer.start(0.25,function(t:FlxTimer):Void{mixmaker();});
		}else{cantouch=true;}
	}
	/**
	 *  return true if level is complete, else return false
	 *  @return Bool
	 */
	function resultcounter():Bool{
		var oldcn:Int=-1;
		var cn:Int=0;
		for (x in 1...8){
			for (y in 1...13){
				cn=saxy[x][y].cn;
				if (oldcn>=0 && cn!=oldcn){
					// trace("oldcn=",oldcn," cn=",cn);
					return false;
					}
				oldcn=cn;
			}
		}
		return true;
	}
	
	var sprite_music:FlxSprite;
	var sprite_new:FlxSprite;
	var sprite_back:FlxSprite;
	var btn_music:FlxButton;
	var btn_new:FlxButton;
	var btn_back:FlxButton;
	
	function btn_musiccallback():Void
	{
		//68569 m2 last point cutted silence + 250 = 68819
		if(music1.playing){ music1.pause(); music2.play(false,0,68819); Main.statemusic=2;}
		else if (music2.playing){music2.pause();Main.statemusic=0;}
		else {music1.play(false,0,240250); Main.statemusic=1;}
	}
	
	function btn_newcallback():Void
	{
		gong=FlxG.sound.load("assets/music/gong.wav",1);
		gong.play();
		Main.saveall();
		var dt:FlxTimer=new FlxTimer();
		// Main.ads.hidebanner();
		dt.start(2.5,function(t:FlxTimer):Void{FlxG.switchState(new PlayState());});
		
	}
	
	function btn_backcallback():Void
	{
		Main.saveall();
		// Main.ads.hidebanner();
		FlxG.switchState(new MenuState());
	}
	
	function buttonmaker():Void
	{
		btn_music=new FlxButton(280,1120,"",btn_musiccallback);
		btn_new=new FlxButton(0,1120,"",btn_newcallback);
		btn_back=new FlxButton(560,1120,"",btn_backcallback);
		btn_music.loadGraphic("assets/images/glass160.png");
		btn_new.loadGraphic("assets/images/glass160.png");
		btn_back.loadGraphic("assets/images/glass160.png");
		add(btn_music);
		add(btn_new);
		add(btn_back);
		
	}
	
	function csmaker():Void
	{
		sprite_music=new FlxSprite(280,1120,"assets/images/menu/music160.png");
		sprite_new=new FlxSprite(0,1120,"assets/images/menu/new160.png");
		sprite_back=new FlxSprite(560,1120,"assets/images/menu/back160.png");
		sprite_music.color=FlxColor.fromRGB(0,255,255);
		sprite_music.alpha=0.5;
		sprite_new.color=FlxColor.fromRGB(0,255,255);
		sprite_new.alpha=0.5;
		sprite_back.color=FlxColor.fromRGB(0,128,255);
		sprite_back.alpha=0.5;
		add(sprite_music); add(sprite_new); add(sprite_back);
		
	}
	
	function textmaker():Void
	{
		t1.setPosition(120,180);
		
		textstylemaker(t1);
		
		add(t1);
	}
	
	function textstylemaker(t:FlxText):Void
	{
		var fw:Int = 60;
		var color:FlxColor = new FlxColor();
		color.setRGB(0,0,0);
		var style:FlxTextBorderStyle = FlxTextBorderStyle.OUTLINE;
		
		// var text:String = "0";
		t.fieldWidth=240;
		t.width=120;
		t.height=120;
		t.updateHitbox();
		t.setFormat("assets/data/RobotoMono-Bold.ttf", 30, FlxColor.fromRGB(255,255,255));
		// t.setBorderStyle(style, color, 0, 1);
		t.autoSize=false;
		t.setSize(120,120);
		t.alignment = CENTER;
		t.y=t.y+95;
		t.alpha=0;
		// add(t);
	}
	
	override public function create():Void
	{
		super.create();
		FlxG.log.redirectTraces = true;
		// extension.wakeLock.WakeLock.allowScreenTimeout = false;
		good=FlxG.sound.load("assets/music/good.wav",1);
		var s1:String="assets/music/statemusic1.ogg";
		var s2:String="assets/music/statemusic2.ogg";
		music1=FlxG.sound.load(s1,1,true); //240250 with 250 pause
		music2=FlxG.sound.load(s2,0.4,true); //68569 + 250
		if (Main.statemusic==1) {music1.play(false,0,240250);}
		else if (Main.statemusic==2) {music2.play(false,0,68819);}
		
		csmaker();
		textmaker();
		buttonmaker();
		
		axycounter();
		mixmaker();
		// cantouch=true;
		// Main.ads.showbanner();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
