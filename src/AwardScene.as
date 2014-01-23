package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import ghostcat.manager.FontManager;
	
	public class AwardScene extends BaseGame
	{
		private const SUB_TF_ID:String="tf_id";
		private const SUB_MC_RUN:String="mc_run_award";
		private var mBtnRun:MovieClip;
		public function AwardScene()
		{
			super();
			this.readData(initUI);
		}
		
		private function initUI():void
		{
			this.mUI=new award_mc();
			this.mUI.x=575;
			this.mUI.y=48;
			this.addChild(mUI);
			this.mBtnRun=mUI[SUB_MC_RUN];
			this.mBtnRun.buttonMode=true;
			//event
			this.mBtnRun.addEventListener(MouseEvent.CLICK,onClicked);
		}
		
		private function clearTimer():void
		{
			if(null!=mTimer)
			{
				this.mTimer.stop();
				this.mTimer.removeEventListener(TimerEvent.TIMER,onTimer);
				this.mTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
				this.mTimer=null;
			}
		}
		
		private function onClicked(e:MouseEvent):void
		{
			if(null==mTimer)
			{
//				mTimer=new Timer(100,50*Math.random()+50);
				mTimer=new Timer(5,0);
				mTimer.addEventListener(TimerEvent.TIMER,onTimer);
				mTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
				mTimer.start();
			}
			else
			{
				this.clearTimer();
			}
		}
		
		private function onTimer(e:TimerEvent):void
		{
			mRand=Math.ceil(Math.random()*mNum);
			while(checkExcept(mRand))
			{
				mRand=Math.ceil(Math.random()*mNum);
			}
			mUI[SUB_TF_ID].text=mRand;
			FontManager.instance.autoEmbedFonts(mUI[SUB_TF_ID]);
		}
		
		private function onTimerComplete(e:TimerEvent):void
		{
			mTimer.removeEventListener(TimerEvent.TIMER,onTimer);
			mTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			mTimer.stop();
			mTimer=null;
		}
		
	}
}