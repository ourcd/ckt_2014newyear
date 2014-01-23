package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import ghostcat.util.display.DisplayUtil;
	
	public class StartScene extends Sprite
	{
		private var mStart:MovieClip;
		public function StartScene()
		{
			super();
			Mouse.cursor=MouseCursor.BUTTON;
			//event
			Main.sRoot.addEventListener(MouseEvent.CLICK,startAnim);
		}
		
		private function startAnim(e:MouseEvent):void
		{
			Main.sRoot.removeEventListener(MouseEvent.CLICK,startAnim);
			Mouse.cursor=MouseCursor.AUTO;
			mStart=new start_mc();
			this.mStart.stop();
			mStart.x=532;
			mStart.y=72;
			this.addChild(mStart);
			//sound
			var snd:Sound=new bg_sound();
			snd.play();
			mStart.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			this.mStart.play();
		}
		
		
		private function onEnterFrame(e:Event):void
		{
			if(mStart.totalFrames==mStart.currentFrame)
			{
				mStart.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
				DisplayUtil.removeAllChildren(this);
				this.parent.removeChild(this);
				//start game scene
				Main.sRoot.addChild(new AwardScene());
//				Main.sRoot.addChild(new GameScene());
			}
		}
		
	}
}