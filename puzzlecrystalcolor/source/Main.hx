package;

import flixel.FlxGame;
// import openfl.Lib;
import openfl.display.Sprite;
import flixel.FlxG;
import flixel.util.FlxSave;

class Main extends Sprite
{
	// public static var ads:Ads;
	public static var game:FlxGame;
	public static var bigprize:Int=0;
	public static var menumusic:Int=1; // 0 1
	public static var statemusic:Int=1; // 0 1 2
	// the saveload sector
	public static var u_name:String="noname";
	public static var u_key:String="-1";
	public static var u_id:String="-1"; //auto sqlite id
	// public static var difficult:Int=1; // 1...4
	
	public static var colorlevel:Int=1; // 1...7
	public static var stamplevel:Int=1; // 1...7
	public static var mixlevel:Int=1; // 1...7
	
	public static var colorlevelcomplete:Int=0; // 0...7
	public static var stamplevelcomplete:Int=0; // 0...7
	public static var mixlevelcomplete:Int=0; // 0...7
	public static var crystals:Array<Bool>=[for (x in 0...10) false]; // 0...9
	
	public static var points:Float=0;
	public static var ss:FlxSave;
	
	public static var testserver:Bool=false; //make false that call to web stts
	
	public static function saveall():Void
	{
		ss=FlxG.save;
		ss.data.u_name=u_name;
		ss.data.u_key=u_key;
		ss.data.u_id=u_id;
		ss.data.points=points;
		ss.data.crystals=crystals;
		ss.data.colorlevel=colorlevel;
		ss.data.stamplevel=stamplevel;
		ss.data.mixlevel=mixlevel;
		ss.data.colorlevelcomplete=colorlevelcomplete;
		ss.data.stamplevelcomplete=stamplevelcomplete;
		ss.data.mixlevelcomplete=mixlevelcomplete;
		ss.flush();
	}
	
	public static function loadall():Void
	{
		ss=FlxG.save;
		if(ss.data.points != null){
			u_name=ss.data.u_name;
			u_key=ss.data.u_key;
			u_id=ss.data.u_id;
			points=ss.data.points;
			crystals=ss.data.crystals;
			colorlevel=ss.data.colorlevel;
			stamplevel=ss.data.stamplevel;
			mixlevel=ss.data.mixlevel;
			colorlevelcomplete=ss.data.colorlevelcomplete;
			stamplevelcomplete=ss.data.stamplevelcomplete;
			mixlevelcomplete=ss.data.mixlevelcomplete;
		}
	}
	
	public function new()
	{
		super();
		// ads=new Ads("ca-app-pub-**","",30,0,"up",false); // true тестовая реклама - banner between pause click updown test
		game=new FlxGame(720, 1280, MenuState,true);
		// game._skipSplash=true;
		addChild(game);
	}
}
