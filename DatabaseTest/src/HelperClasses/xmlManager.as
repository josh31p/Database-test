package HelperClasses
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	public class xmlManager
	{
		//create a new xml document
		private var xmlDoc:XMLDocument = new XMLDocument;
		
		public function xmlManager()
		{
			
		}
		
//		public function GenerateXML(inArray:Array):void
//		{
//			
//			xmlDoc.xmlDecl = '<?xml version="1.0" encoding="UTF-8"?>';
//			
//			//create a new root node
//			var rootNode:XMLNode;
//			rootNode = xmlDoc.createElement("NES");
//			
//			//create the fuels node
//			var sectionNode:XMLNode;
//			var fuelNode:XMLNode;
//			
//			//var nodeText:XMLNode;
//			
//			xmlDoc.insertBefore(rootNode,sectionNode);
//			
//			sectionNode = xmlDoc.createElement("Fuels");
//			rootNode.appendChild(sectionNode);
//			
//			
//			
//			//create a integer variable for the for loop
//			var i:int;
//			
//			
//			
//			//go through all the fuels returned from the database
//			for (i = 0; i < inArray.length; i++)
//			{
//				
//				var idNodeText:XMLNode = new XMLNode(3,"");
//				var priceNodeText:XMLNode = new XMLNode(3,"");
//				var idChildNode:XMLNode;
//				var priceChildNode:XMLNode;
//				
//				fuelNode = xmlDoc.createElement("Fuel");
//				sectionNode.appendChild(fuelNode);
//				idChildNode = xmlDoc.createElement("FuelID");
//				idChildNode.nodeType = 1;
//				//childNode.nodeValue = inArray[i].FuelID;
//				
//				idNodeText.nodeValue=inArray[i].FuelID;
//				idChildNode.appendChild(idNodeText);
//				fuelNode.appendChild(idChildNode);
//				
//				priceChildNode = xmlDoc.createElement("Price");
//				priceNodeText.nodeValue=inArray[i].Price;
//				priceChildNode.appendChild(priceNodeText);
//				fuelNode.appendChild(priceChildNode);
//				
//			}
//			
//			
//			var file:File = File.documentsDirectory.resolvePath("/Users/Nilan/test.xml");
//			
//			var fileStream:FileStream = new FileStream;
//			
//			fileStream.open(file,FileMode.WRITE);
//			
//			fileStream.writeObject(xmlDoc);
//			fileStream.close();
//			
//		}
		
		public function CreateTable(inXML:XML, inNodeName:String):XML
		{
			var retVal:XML = new XML;
			if (inNodeName !="")
				
			{
				var newNode:XML = <{inNodeName}></{inNodeName}> ;
				inXML.appendChild(newNode);
				retVal = newNode;
			}
			
			return retVal;
		}
		
		public function CreateNode(inNode:XML, inNodeName:String, inValue:String):void
		{
			if (inNodeName !="" && inValue !="")
			{
				var newNode:XML = <{inNodeName}>{inValue}</{inNodeName}> ;
				inNode.appendChild(newNode);
			}
		}
		
		public function WriteFile(inXML:XML):void
		{
			var file:File = File.documentsDirectory.resolvePath("/Users/Nilan/test2.xml");
			
			var fileStream:FileStream = new FileStream;
			
			fileStream.open(file,FileMode.WRITE);
			
			fileStream.writeObject(inXML);
			fileStream.close();
		}
		
//		public function GenerateNewXML():void
//		{
//			var xmlDoc:XML = <NES></NES>;
//			
//			var someNode:XML = <FuelID>1</FuelID>;
//				
//			
//			xmlDoc.appendChild(someNode);
//			
//			var file:File = File.documentsDirectory.resolvePath("/Users/Nilan/test2.xml");
//			
//			var fileStream:FileStream = new FileStream;
//			
//			fileStream.open(file,FileMode.WRITE);
//			
//			fileStream.writeObject(xmlDoc);
//			fileStream.close();
//		}
	}
}