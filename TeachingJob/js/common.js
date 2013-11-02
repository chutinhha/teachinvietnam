function inArray( srcArray,value )
{
    var i;
    for ( i = 0; i < srcArray.length; i++ )
    {
        if ( srcArray[ i ] === value )
        {
            return true;
        }
    }
    return false;
};

jQuery.fn.gcdTabs = function()
{
	this.find( "li" ).click( function( event )
	{
		li = jQuery( this );
		li.parents( "ul:first" ).find( "li" ).removeClass( "selected" ).find( "a" ).each( function()
		{
			jQuery( this.hash + "-tab" ).removeClass( "show" ).addClass( "hide" );
		});
		tabId = li.find( "a" )[0].hash;
		jQuery( tabId + "-tab" ).addClass( "show" ).removeClass( "hide" );
		li.addClass( "selected" );
		event.preventDefault();
	});
	this.find( "li a[href="+ location.hash +"]" ).click();
	return false;
};
