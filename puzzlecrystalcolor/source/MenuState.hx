package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
// import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
// import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

class MenuState extends FlxState
{
	var cantouch:Bool = false;
	var ck:ColorKeeper=new ColorKeeper();
	var music:FlxSound;
	var fix:FlxSound;
	var gong:FlxSound;
	
	function btn_progresscallback():Void
	{
		fix.play(true);
		var dt:FlxTimer=new FlxTimer();
		// Main.ads.hidebanner();
		dt.start(1, function(t:FlxTimer):Void{FlxG.switchState(new StatS());});
	}
	
	function btn_musicpngcallback():Void
	{
		if (music.playing){music.pause(); Main.menumusic=0;}
		else {music.play(); Main.menumusic=1;}
	}
	
	function btn_playcallback():Void
	{
		cantouch=false;
		gong.play(true);
		var dt:FlxTimer=new FlxTimer();
		// Main.ads.hidebanner();
		dt.start(3, function(t:FlxTimer):Void{FlxG.switchState(new PlayState());});
	}
	
	// difficult level section maker
	var sacolor:Array<FlxSprite>=new Array(); //colorlevel mark array
	var sasvcolor:Array<FlxSprite>=new Array(); //colorlevel mark array
	var sasv2color:Array<FlxSprite>=new Array(); //colorlevel mark array
	var sastamp:Array<FlxSprite>=new Array(); //stamplevel mark array
	var samix:Array<FlxSprite>=new Array(); //mixlevel mark array
	function colorlevelstart():Void{
		for (i in 1...8){
			sacolor[i].color=ck.c(i);
			sasv2color[i].color=ck.c(i);
			if (i>Main.colorlevelcomplete+1){sacolor[i].alpha=0;sasvcolor[i].alpha=0;sasv2color[i].alpha=0;}
			else if (i<=Main.colorlevel){sacolor[i].alpha=1;sasvcolor[i].alpha=1;sasv2color[i].alpha=0.5;}
			else{sacolor[i].alpha=0.15;sasvcolor[i].alpha=0.15;sasv2color[i].alpha=0.075;}
		}
	}
	function colorlevelcallback():Void{
		if(cantouch){
			if (Main.colorlevel<Main.colorlevelcomplete+1 && Main.colorlevel<7){Main.colorlevel+=1;}
			else{Main.colorlevel=1;}
			colorlevelstart();
		}
	}
	
	function stamplevelstart():Void{
		for (i in 1...8){
			sastamp[i].color=ck.c(i);
			if (i>Main.stamplevelcomplete+1){sastamp[i].alpha=0;}
			else if (i==Main.stamplevel){sastamp[i].alpha=1;}
			else{sastamp[i].alpha=0.15;}
		}
	}
	function stamplevelcallback():Void{
		if(cantouch){
			if (Main.stamplevel<Main.stamplevelcomplete+1 && Main.stamplevel<7){Main.stamplevel+=1;}
			else {Main.stamplevel=1;}
			stamplevelstart();
		}
	}
	
	function mixlevelstart():Void{
		for (i in 1...8){
			samix[i].color=ck.c(i);
			if (i>Main.mixlevelcomplete+1){samix[i].alpha=0;}
			else if (i==Main.mixlevel){samix[i].alpha=1;}
			else{samix[i].alpha=0.15;}
		}
	}
	function mixlevelcallback():Void{
		if(cantouch){
			if (Main.mixlevel<Main.mixlevelcomplete+1 && Main.mixlevel<7){Main.mixlevel+=1;}
			else {Main.mixlevel=1;}
			mixlevelstart();
		}
	}
	
	function difficultbuttonsmaker():Void{
		var buts:FlxSprite; var sv:FlxSprite; var sv2:FlxSprite; var fonbuts:FlxSprite;
		buts=new FlxSprite(560,320);
		buts.loadGraphic("assets/images/menu/btn160.png");
		buts.color=FlxColor.fromRGB(0,128,255);
		add(buts);
		sv=new FlxSprite(560,320);
		sv.loadGraphic("assets/images/menu/btn160svet.png");
		add(sv);
		sv2=new FlxSprite(560,320);
		sv2.loadGraphic("assets/images/menu/btn160svet.png");
		sv2.color=FlxColor.fromRGB(0,128,255);
		sv2.alpha=0.5;
		add(sv2);
		fonbuts=new FlxSprite(560,320);
		fonbuts.loadGraphic("assets/images/menu/btn160fon.png");
		add(fonbuts);
		
		var anicolor:FlxSprite=new FlxSprite(600,360);
		anicolor.loadGraphic("assets/images/menu/back_ani_btn160.png",true,80,80);
        anicolor.animation.add("loop5",[89,90,91,92,93,94,95,96,97,98,99,80,81,82,83,84,85,86,87,88,89],20,true);
		anicolor.animation.play("loop5");
		anicolor.angle=90;
		anicolor.color=FlxColor.fromRGB(0,128,255);
		add(anicolor);
		
		var colorlevel:FlxButton=new FlxButton(560,320,"",colorlevelcallback);
		colorlevel.loadGraphic("assets/images/glass160.png");
		add(colorlevel);
		
		// stamp
		buts=new FlxSprite(560,560);
		buts.loadGraphic("assets/images/menu/btn160.png");
		buts.color=FlxColor.fromRGB(0,128,255);
		add(buts);
		sv=new FlxSprite(560,560);
		sv.loadGraphic("assets/images/menu/btn160svet.png");
		add(sv);
		sv2=new FlxSprite(560,560);
		sv2.loadGraphic("assets/images/menu/btn160svet.png");
		sv2.color=FlxColor.fromRGB(0,128,255);
		sv2.alpha=0.5;
		add(sv2);
		fonbuts=new FlxSprite(560,560);
		fonbuts.loadGraphic("assets/images/menu/btn160fon.png");
		add(fonbuts);
		
		var anistamp:FlxSprite=new FlxSprite(600,600);
		anistamp.loadGraphic("assets/images/menu/back_ani_btn160.png",true,80,80);
        anistamp.animation.add("loop5",[89,90,91,92,93,94,95,96,97,98,99,80,81,82,83,84,85,86,87,88,89],20,true);
		anistamp.animation.play("loop5");
		anistamp.angle=90;
		anistamp.color=FlxColor.fromRGB(0,128,255);
		add(anistamp);
		
		var stamplevel:FlxButton=new FlxButton(560,560,"",stamplevelcallback);
		stamplevel.loadGraphic("assets/images/glass160.png");
		add(stamplevel);
		
		// mix
		buts=new FlxSprite(560,800);
		buts.loadGraphic("assets/images/menu/btn160.png");
		buts.color=FlxColor.fromRGB(0,128,255);
		add(buts);
		sv=new FlxSprite(560,800);
		sv.loadGraphic("assets/images/menu/btn160svet.png");
		add(sv);
		sv2=new FlxSprite(560,800);
		sv2.loadGraphic("assets/images/menu/btn160svet.png");
		sv2.color=FlxColor.fromRGB(0,128,255);
		sv2.alpha=0.5;
		add(sv2);
		fonbuts=new FlxSprite(560,800);
		fonbuts.loadGraphic("assets/images/menu/btn160fon.png");
		add(fonbuts);
		
		var animix:FlxSprite=new FlxSprite(600,840);
		animix.loadGraphic("assets/images/menu/back_ani_btn160.png",true,80,80);
        animix.animation.add("loop5",[89,90,91,92,93,94,95,96,97,98,99,80,81,82,83,84,85,86,87,88,89],20,true);
		animix.animation.play("loop5");
		animix.angle=90;
		animix.color=FlxColor.fromRGB(0,128,255);
		add(animix);
		
		var mixlevel:FlxButton=new FlxButton(560,800,"",mixlevelcallback);
		mixlevel.loadGraphic("assets/images/glass160.png");
		add(mixlevel);
		for (i in 1...8){
			var s:FlxSprite=new FlxSprite(560-80*i,320+40,"assets/images/menu/color80.png");
			sacolor[i]=s;
			add(sacolor[i]);
			var sv:FlxSprite=new FlxSprite(560-80*i,320+40,"assets/images/menu/color80svet.png");
			sasvcolor[i]=sv;
			add(sasvcolor[i]);
			var sv2:FlxSprite=new FlxSprite(560-80*i,320+40,"assets/images/menu/color80svet2.png");
			sasv2color[i]=sv2;
			add(sasv2color[i]);
			s=new FlxSprite(560-80*i,560+40,"assets/images/menu/stamp80"+ Std.string(i) +".png");
			sastamp[i]=s;
			add(sastamp[i]);
			s=new FlxSprite(560-80*i,800+40,"assets/images/menu/mix80"+ Std.string(i) +".png");
			samix[i]=s;
			add(samix[i]);
		}
		
	}
	
	function prizecallback(x:Int):Void{
		Main.bigprize=x;
		// Main.ads.hidebanner();
		FlxG.switchState(new PrizeState());
	}
	function prizemaker():Void{
		var x:Int=80;
		for (i in 1...10){
			if (Main.crystals[i]){
				var s0:FlxSprite=new FlxSprite(x*(i-1),160);
				s0.loadGraphic("assets/images/menu/prize0.png",true,80,80);
				s0.animation.add("dance",[for (i in 1...11) i],10,true);
				s0.animation.play("dance",true);
				s0.angularVelocity=-30;
				add(s0);
				var s:FlxSprite=new FlxSprite(x*(i-1),160,"assets/images/menu/prize"+Std.string(i)+".png");
				add(s);
				var s000:FlxSprite=new FlxSprite(x*(i-1),160);
				s000.loadGraphic("assets/images/menu/prize000.png",true,80,80);
				var anif:Array<Int>=[for (i in 1...11) i];
				anif=anif.concat([for (i in 0...60) 1]);
				s000.animation.add("dance",anif,10,true);
				s000.animation.play("dance",true);
				add(s000);
				
				var b:FlxButton=new FlxButton(x*(i-1),160,"",function():Void{prizecallback(i);});
				b.loadGraphic("assets/images/glass80.png");
				add(b);
			}
		}
	}
	
	override public function create():Void
	{
		super.create();
		// extension.wakeLock.WakeLock.allowScreenTimeout = false;
		Main.loadall();
		// trace("menustatecreate",Main.u_id,Main.u_key);
		music=FlxG.sound.load("assets/music/menumusic.ogg",1,true);
		fix=FlxG.sound.load("assets/music/fix.wav",0.25);
		if (Main.menumusic==1){ music.play();}
		else {fix.play();}
		gong=FlxG.sound.load("assets/music/gong.wav",1);
		// gong.play();
		
		var fon:FlxSprite=new FlxSprite(0,0,"assets/images/fon/fon1.png");
		add(fon);
		difficultbuttonsmaker();
		colorlevelstart();
		stamplevelstart();
		mixlevelstart();
		var musicpng:FlxSprite=new FlxSprite(0,1120,"assets/images/menu/music160.png");
		add(musicpng);
		var btn_musicpng:FlxButton=new FlxButton(0,1120,"",btn_musicpngcallback);
		btn_musicpng.loadGraphic("assets/images/glass160.png",false,160,160);
		add(btn_musicpng);
		
		var progress:FlxSprite=new FlxSprite(240,1120,"assets/images/menu/progress160.png");
		add(progress);
		var btn_progress:FlxButton=new FlxButton(240,1120,"",btn_progresscallback);
		btn_progress.loadGraphic("assets/images/glass160.png",false,160,160);
		add(btn_progress);
		
		var go:FlxSprite=new FlxSprite(480,1040,"assets/images/menu/go240.png");
		go.color=FlxColor.fromRGB(0,128,255);
		add(go);
		var go_svet:FlxSprite=new FlxSprite(480,1040,"assets/images/menu/go240svet.png");
		add(go_svet);
		
		var btn_play:FlxButton=new FlxButton(480,1040,"",btn_playcallback);
		btn_play.loadGraphic("assets/images/glass240.png",false,240,240);
		add(btn_play);
		prizemaker();
		cantouch=true;
		// Main.ads.showbanner();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}
