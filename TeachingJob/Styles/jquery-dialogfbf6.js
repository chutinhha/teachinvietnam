
if ( !window.dialogs )
{
	window.dialogs = {};
}

function CloseDialog( dialogName )
{
	$( "#PgJqueryDialog-" + dialogName ).dialog( "close" );
	$( "#PgJqueryDialog-" + dialogName ).remove();
}

function OpenDialogOnReady( dialogName, params, settingsOverride, contentOverride )
{
	var dialog = window.dialogs[ dialogName ];

	$.extend( dialog, settingsOverride );

	if ( contentOverride == "" )
	{
		contentOverride = dialog.content;
	}

	var dialogHtml = "<div id='PgJqueryDialog-" + dialogName + "' title='" + dialog.title.replace( "'", "\'" ) + "'>";
	dialogHtml += contentOverride;
	dialogHtml += "</div>";

	$( "body" ).prepend( dialogHtml );

	var dialogOptions = {
			autoOpen: true,
			modal: true,
			close: function( event, ui )
			{
				$( this ).remove();
			}
		};

	if ( dialog.additionalOptions )
	{
		var addOptions = dialog.additionalOptions;
		for( k in addOptions )
		{
			dialogOptions[ k ] = addOptions[ k ];
		}
	}

	if( dialog.close )
	{
		closemethod = dialog.close;
		dialogOptions.close = function( event, ui ) {
			closemethod( params );
			$( this ).remove();
		}
	}

	if ( dialog.width != 0 )
	{
		dialogOptions.width = dialog.width;
	}

	if ( dialog.height != 0 )
	{
		dialogOptions.height = dialog.height;
	}

	if ( dialog.dialogClass )
	{
		dialogOptions.dialogClass = dialog.dialogClass;
	}

	if ( dialog.ajaxUrl )
	{
		dialogOptions.open = function()
		{
			var paramString = dialog.ajaxUrlParamString;

			if ( params )
			{
				for( var x = 0; x < params.length; x++ )
				{
					paramString += "param" + x + "=" + params[x];
				}
			}

			$.ajax(
			{
					type: 'POST',
					url: dialog.ajaxUrl,
					data: paramString,
					success: function( data )
					{
						$( "#PgJqueryDialog-" + dialogName ).html( data );
					}
			} );
		};
	}

	if ( dialog.resize )
	{
		dialogOptions.resize = dialog.resize;
	}

	if ( dialog.open )
	{
		if ( dialogOptions.open )
		{
			var loadCall = dialogOptions.open;

			dialogOptions.open = function(){ loadCall();

            $( 'body' ).addClass( 'dialog-open' );

            if ( typeof( window.PgJqDialogResizer ) == 'function' )
            {
                window.PgJqDialogResizer( dialogName );
            }

            dialog.open( params ) };
		}
		else
		{
			dialogOptions.open = function(){

                $( 'body' ).addClass( 'dialog-open' );

                if ( typeof( window.PgJqDialogResizer ) == 'function' )
                {
                    window.PgJqDialogResizer( dialogName );
                }

                dialog.open( params ) };
		}
	}
    else
    {
        dialogOptions.open = function()
        {

            $( 'body' ).addClass( 'dialog-open' );

            if ( typeof( window.PgJqDialogResizer ) == 'function' )
            {
                window.PgJqDialogResizer( dialogName );
            }
        }
    }

	if ( dialog.position )
	{
		dialogOptions.position = dialog.position;
	}

	$( "#PgJqueryDialog-" + dialogName ).dialog(
		dialogOptions
	);
}

function OpenDialog( dialogName, params, settingsOverride  )
{
	var dialog = window.dialogs[ dialogName ];

	if ( dialog.ajaxCall )
	{
		var ajaxParams = [ dialogName ];
        var dialogSettingKeys = "";

		if ( params )
		{
			for ( var i in params )
			{
                if ( parseInt( i ) == i )
                {
                    ajaxParams[ ajaxParams.length ] = params[i];
                }
                else
                {
                    ajaxParams[ i ] = params[ i ];
                }

                dialogSettingKeys += i + ",";
			}
		}

        ajaxParams[ "dialog-params" ] = dialogSettingKeys;

		ServerCall( dialog.ajaxCall, ajaxParams, function( callData, response )
		{
			OpenDialogOnReady( dialogName, params, settingsOverride, response );
		} );
	}
	else
	{
		OpenDialogOnReady( dialogName, params, settingsOverride, "" );
	}
}

window.PgJqDialogResizer = function( dialogName )
{
	var dialog = $( '#PgJqueryDialog-' + dialogName );

	var autoStretchVertical = dialog.dialog( 'option', 'autoStretchVertical' );
	var autoStretchHorizontal = dialog.dialog( 'option', 'autoStretchHorizontal' );
	var autoFitToContent = dialog.dialog('option', 'autoFitToContent');

	var screenHeight = $(window).height();
	var screenWidth = $(window).width();


	if ( autoStretchHorizontal )
	{
		var dialogWidth = screenWidth - 80;
		var left = ( screenWidth - dialogWidth ) / 2;

		dialog.parent().width( dialogWidth );
		dialog.parent().css( 'left', left + 'px' );
	}

	var titleHeight = dialog.parent().children( '.ui-dialog-titlebar' ).outerHeight();
	var contentHeight = dialog.outerHeight() + titleHeight;
	var contentMargins = dialog.outerHeight() - dialog.height();

	var dialogHeight;

	if ( autoStretchVertical )
	{
		dialogHeight = screenHeight - 80;
	}
	else
	{
		dialogHeight = contentHeight;
	}

	dialogHeight = Math.max( dialogHeight, 400 );
	dialogHeight = Math.min( dialogHeight, screenHeight - 80 );

	var top = ( screenHeight - dialogHeight ) / 2;

	var parent = dialog.parent();
	parent.css( 'position', 'absolute' ).css( 'top', ( $(window).scrollTop() + top ) + 'px' );

	if( autoFitToContent == false )
	{
		parent.height(dialogHeight);
		if (dialogHeight != contentHeight)
		{
			dialog.height(dialogHeight - titleHeight - contentMargins);
		}
		$('#PgJqueryDialog-' + dialogName + ' .dialog-content').height(dialogHeight - 106);
	}

    // This line is for Pagelets dialogs only.
	$( '#PgJqueryDialog-' + dialogName + ':tabbable:first' ).focus();

	dialog.find( ':tabbable:first' ).focus();
}