package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import ghostcat.manager.FontManager;
	
	public class GameScene extends BaseGame
	{
		private const SUB_MC_RUN:String="mc_run_game";
		private const SUB_TF_NAME:String="tf_name";
		private const SUB_TF_DEPARTMENT:String="tf_department";
		private const SUB_TF_SEX:String="tf_sex";
		public function GameScene()
		{
			super();
			this.readData(initUI);
		}
		
		public function initUI():void
		{
			this.mouseChildren=true;
			this.mUI=new game_mc();
			this.mUI.x=575;
			this.mUI.y=48;
			this.addChild(mUI);
			//add event
			(mUI[SUB_MC_RUN] as MovieClip).buttonMode=true;
			mUI[SUB_MC_RUN].addEventListener(MouseEvent.CLICK,onBtnClicked);
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
		
		
		
		private function onBtnClicked(e:MouseEvent):void
		{
			if(null==mTimer)
			{
//				this.mTimer=new Timer(100,Math.random()*50+50);
				this.mTimer=new Timer(5,0);
				this.mTimer.addEventListener(TimerEvent.TIMER,onTimer);
				this.mTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
				this.mTimer.start();
			}
			else
			{
				this.clearTimer();
				this.mExceptList.push(mRand);
			}
		}
				
		private function onTimer(e:TimerEvent):void
		{
			mRand=Math.ceil(Math.random()*mNum);
			while(checkExcept(mRand))
			{
				mRand=Math.ceil(Math.random()*mNum);
			}
			mUI[SUB_TF_NAME].text=mSheet0.getCellValue("C"+mRand);
			FontManager.instance.autoEmbedFonts(mUI[SUB_TF_NAME]);
			mUI[SUB_TF_DEPARTMENT].text=mSheet0.getCellValue("B"+mRand);
			FontManager.instance.autoEmbedFonts(mUI[SUB_TF_DEPARTMENT]);
			mUI[SUB_TF_SEX].text=mSheet0.getCellValue("D"+mRand);
			FontManager.instance.autoEmbedFonts(mUI[SUB_TF_SEX]);
		}
		
		private function onTimerComplete(e:TimerEvent):void
		{
			this.mExceptList.push(mRand);
			this.mTimer.stop();
			this.mTimer.removeEventListener(TimerEvent.TIMER,onTimer);
			this.mTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			this.mTimer=null;
		}
		
	}
}