package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import ghostcat.util.display.DisplayUtil;
	
	public class MenuScene extends Sprite
	{
		private const SUB_GAME:String="btn_game";
		private const SUB_AWARD:String="btn_award";
		private var mUI:main_mc=new main_mc();
		public function MenuScene()
		{
			super();
			this.addChild(mUI);
			(mUI[SUB_GAME] as MovieClip).buttonMode=true;
			(mUI[SUB_AWARD] as MovieClip).buttonMode=true;
			//event
			mUI.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			switch(e.target.name)
			{
				case SUB_GAME:
					Main.sRoot.addChild(new GameScene());
					this.destroy();
					break;
				case SUB_AWARD:
					Main.sRoot.addChild(new AwardScene());
					this.destroy();
					break;
			}
		}
		
		private function destroy():void
		{
			mUI.removeEventListener(MouseEvent.CLICK,onClick);
			DisplayUtil.removeAllChildren(this);
			this.parent.removeChild(this);
			
		}
		
		
	}
}