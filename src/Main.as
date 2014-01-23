package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;

	[SWF(width="1536",height="564",backgroundColor="0x000000",frameRate="25")]
	public class Main extends Sprite
	{
		public static var sRoot:Main;
		public function Main()
		{
			sRoot=this;
			stage.scaleMode=StageScaleMode.SHOW_ALL;
			this.showBG();
			this.addChild(new StartScene());
		}
		
		private function showBG():void
		{
			var mc:MovieClip=new main_mc();
//			mc.x=-235;
			this.addChild(mc);
		}
	}
}