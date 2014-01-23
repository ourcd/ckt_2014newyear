package
{
	import com.childoftv.xlsxreader.Worksheet;
	import com.childoftv.xlsxreader.XLSXLoader;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	
	public class BaseGame extends Sprite
	{
		public var mUI:MovieClip=null;
		public var mTimer:Timer=null;
		public var mExceptList:Array=new Array();
		public var mRand:int=1;
		public var mExcelLoader:XLSXLoader=new XLSXLoader();
		public var mSheet0:Worksheet;
		public var mNum:int;
		public function BaseGame()
		{
			super();
		}
		
		
		public function readData(call:Function):void
		{
			//Listen for when the file is loaded
			mExcelLoader.addEventListener(Event.COMPLETE,function(e:Event):void
			{
				mSheet0=mExcelLoader.worksheet("Sheet0");
				mNum=mSheet0.getRows().length();
				call();
				trace(mNum);
			});
			//Load the file
			mExcelLoader.load("data.xlsx");
		}
		
		//check whether has picked this user
		public function checkExcept(id:int):Boolean
		{
			for(var i:int=0;i<mExceptList.length;i++)
			{
				if(id==mExceptList[i])
				{
					return true;
				}
			}
			return false;
		}
		
				
		
	}
}