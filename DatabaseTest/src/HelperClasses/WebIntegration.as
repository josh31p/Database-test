package HelperClasses
{
	
	import flash.events.Event;
	import flash.xml.XMLDocument;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.soap.WebService;
	
	import services.service1.Service1;
	
	public class WebIntegration
	{
		
		private var newWS:WebService = new WebService;
		
		public function WebIntegration()
		{
			newWS.wsdl="http://www.nilanperera.co.uk/service1.asmx?wsdl";	
			newWS.loadWSDL(); 
		
		}
		
		
		// Calling Hello world web service
		//--------------------------------
		public function getResult(event:ResultEvent):void
		{
			Alert.show(event.result.toString());
		}
		
		public function DoSomething():void
		{
			
			newWS.HelloWorld.addEventListener(ResultEvent.RESULT,getResult);
			
			newWS.HelloWorld();
		}
		//*******************************************************************************************
		
		
		// calling the calculate xml web service
		// this method takes an xml in byref and ammends it
		//---------------------------------------------------
		public function getXMLResult(event:ResultEvent):void
		{
			var resultXML:XML = new XML;
			
			resultXML = XML(event.result.inXML);
		}
		
		public function CallXMLService(inXML:XML):void
		{
			var xmlDoc:String = inXML.toString();
			newWS.CalculateXMLstring.addEventListener(ResultEvent.RESULT,getXMLResult);
			
			newWS.CalculateXMLstring(xmlDoc);
		}
		//*******************************************************************************************
	}
}