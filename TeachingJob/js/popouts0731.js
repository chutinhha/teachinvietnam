( function($)
{
	$.fn.popoutInput = function( options )
	{
		var defaults =
		{
			width: 120,
			popoutWidth: 120,
			maxPopoutHeight: 250
		};

		var options = $.extend( defaults, options );

		return this.each( function()
		{
			var container = $(this);
			var containerId = this.id;

			$( 'body' ).click( function( event )
			{
				if ( $( event.target ).parents( '#' + containerId ).length != 1 )
				{
					contentElement.hide();
				}
			} );

			var triggerElement = $( this ).find( '.trigger' );
			var contentElement = $( this ).find( '.popout-input-content' );
			var displayElement = $( this ).find( '.popout-input-display' );

			contentElement.width( options.popoutWidth );

			triggerElement.click( function()
			{
				contentElement.toggle();

				if ( contentElement.height() > options.maxPopoutHeight )
				{
					contentElement.height( options.maxPopoutHeight );
				}
			} );
		} );
	}
} )( jQuery );