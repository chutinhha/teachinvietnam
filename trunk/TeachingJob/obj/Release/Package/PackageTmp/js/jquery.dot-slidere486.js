(function( $ )
{
	$.widget( "ui.dotSlider",
	{
		options:
		{
			sliderInterval : 6000
		},
		_create: function()
		{
			var self = this;
			var sliderPos = 0;
			var sliderPositions = new Array();
			var sliderIntervalId;

			var totalWidth = 0;

			//this.options.moduleHeight = $( this.element.find( ".module" )[0] ).height();

			//this.options.htmlName = this.element.attr( "id" );

			this.element.find( ".slides .slide" ).each ( function(i)
			{
				sliderPositions[i] = totalWidth;

				//NOT WORKING! Doesn't seem to like the width.
				//totalWidth += $( this ).width() + parseInt( $( this ).css( "margin-right" ) );
				totalWidth += 1020;

				//$( this ).height( self.options.moduleHeight );
			});

			this.element.find( ".slides" ).width(totalWidth);

			this.element.find( ".dots-nav ul li a" ).bind( "click.dotSlider", function( event )
			{
				self.element.find( ".dots-nav li" ).addClass( 'current ');

				$( this ).parent().siblings().removeClass( "current" );

				sliderPos = $( this ).parent().prevAll( ".dots-nav li" ).length;

				self.element.find( ".slides" ).stop().animate( {left:-sliderPositions[sliderPos]+'px'}, 850 );

				event.preventDefault();
				event.stopImmediatePropagation();
			});

			this.element.find( ".dots-nav ul li:first" ).addClass( "current" ).siblings();

			this.element.find( ".slide-wrapper" ).parents( "div:first" ).bind( "mouseover.dotSlider", function()
			{
				clearInterval( sliderIntervalId )
			});

			this.element.find( ".slide-wrapper" ).parents( "div:first" ).bind( "mouseout.dotSlider", function()
			{
				//sliderIntervalId = setInterval( function(){ self.SliderNextSlide() }, self.options.sliderInterval );
			});

			this._setDragable( sliderPositions );

			//sliderIntervalId = setInterval( function(){ self.SliderNextSlide() }, self.options.sliderInterval );

		},
		_setDragable: function( sliderPositions )
		{
			var self = this;

			this.element.find( ".#slides" ).draggable(
			{
				axis: 'x',
				stop: function()
				{
					currentPos = parseInt( self.element.find( ".slides" ).css( "left" ).replace( "px","" ) );

					if ( currentPos >= 0 )
					{
						newPos = 0;
					}
					else
					{
						var newPos = Math.round( Math.abs( currentPos / 501));
					}

					if(newPos >= sliderPositions.length)
					{
						newPos = sliderPositions.length - 1;
					}

					$( self.element.find( ".dots-nav ul li a" )[newPos] ).triggerHandler( "click" );
				}
			});
		},
		SliderNextSlide: function()
		{
			sliderPos++;

			if( sliderPos >= this.element.find( ".dots-nav li" ).length )
			{
				sliderPos = 0;
			}

			$( this.element.find( ".dots-nav ul li a" )[sliderPos]).triggerHandler( "click" );
		}
	});

})(jQuery);