/**
 * Created by JetBrains RubyMine.
 * User: Arijit Lahiri
 * Date: 19/7/11
 * Time: 7:25 PM
 * To change this template use File | Settings | File Templates.
 */

jQuery.preloadImages = function()
{
	for(var i = 0; i<arguments.length; i++)
	{
		jQuery("<img>").attr("src", arguments[i]);
	}
}

