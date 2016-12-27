/*
* Short Description
* 
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clientside & Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/

titleText["Select Map Position", "PLAIN"];
onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";