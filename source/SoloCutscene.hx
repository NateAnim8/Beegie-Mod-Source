package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIState;

class SoloCutscene extends FlxUIState
{

    var path:String;
    var returnState:FlxState;

    override public function new(_path:String, _returnState:FlxState){

        path = _path;
        returnState = _returnState;
        super();

    }

    override public function create():Void{

        super.create();

        var video:VideoHandler = new VideoHandler();
		video.antialiasing = true;
		video.scale.set(0.67, 0.67);
		video.updateHitbox();
		video.x -= 320;
		video.y -= 180;
		video.playMP4(path, function(){
            FlxG.sound.playMusic(Paths.music('freakyMenu'));
            FlxG.switchState(returnState);
		}, false, true);
		add(video);

    }

}