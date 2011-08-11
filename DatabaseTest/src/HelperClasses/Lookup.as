package HelperClasses
{
	import mx.collections.ArrayList;
	
	import valueObjects.FuelObject;
	
	public class Lookup
	{
		
		public var fuelList:ArrayList = new ArrayList;
		
		//the constructor
		public function Lookup()
		{
			populateLists();
		}
		
		
		//This sub populates the fuel list array list with the fuel code and name
		protected function populateLists():void
		{
			fuelList.addItem(new FuelObject(1,"Gas"));
			fuelList.addItem(new FuelObject(2,"LPG"));
			fuelList.addItem(new FuelObject(3,"Electricity"));
			fuelList.addItem(new FuelObject(4,"Bio fuel"));
			fuelList.addItem(new FuelObject(5,"Wood pellets"));
			fuelList.addItem(new FuelObject(6,"Oil"));
		}//End sub
		
		
		//This function takes the fuel ID and returns the fuel name
		public function GetFuelDesc(inFuelID:int):String
		{	
			var retVal:String;
			
			//first check to make sure we have fuel in the list
			if (fuelList.length > 0)
			{
				//go through all the fuels in the list	
				for each (var fuelItem:FuelObject in fuelList.source)
				{
					//check to see if the fuel is the fuel we want
					if (fuelItem.ID == inFuelID)
					{
						//it is so get the fuel name
						retVal = fuelItem.Name;
					}
					
				}
				
			}
			//return the fuel name
			return retVal;
		}//End Function
		
		
		//This function takes the fuel name and returns the Fuel ID
		public function GetFuelID(inFuelName:String):int
		{	
			var retVal:int;
			
			//first check to make sure we have fuel in the list
			if (fuelList.length > 0)
			{
				//go through all the fuels in the list
				for each (var fuelItem:FuelObject in fuelList.source)
				{
					//check to see if the fuel is the fuel we want
					if (fuelItem.Name == inFuelName)
					{
						//it is so get the fuel ID
						retVal = fuelItem.ID;
					}
					
				}
				
			}
			//return the fuel id
			return retVal;
		}//End function
		
		
		//This function takes the array which is returned from the database and creates a new araylist with
		//the fuel names instead of the code.
		public function GetFuelArray(inArray:Array):ArrayList
		{
			//create a new arraylist
			var fuelNameList:ArrayList = new ArrayList;
			//create a integer variable for the for loop
			var i:int;
			
			//go through all the fuels returned from the database
			for (i = 0; i < inArray.length; i++)
			{
				//get the FuelID and look up the name from the fuel list.
				// then add it to the new arraylist with the price.
				//we are defining the arraylist on the fly. The array will have two columns Fuel and Price.
				fuelNameList.addItem({Fuel: GetFuelDesc(inArray[i].FuelID), Price: inArray[i].Price});
			}
			
			//return the new arraylist
			return fuelNameList;
			
		}//end function
	}
}