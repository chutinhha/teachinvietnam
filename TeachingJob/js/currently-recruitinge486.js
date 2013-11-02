var sliderPos = 0;
var sliderPositions = new Array();
var sliderInterval = 6000;
var sliderIntervalId;


if( $.cookie("EnableAnimations") != "false" )
{
	$(document).ready ( function() {

		var totalWidth = 0;
		$("#slides .slide").each ( function(i) {

			sliderPositions[i] = totalWidth;
			totalWidth += $(this).width();
		});

		$("#slides").width(totalWidth);

		$("#currently-recruiting-nav ul li a").click( function(e) {

			$("#currently-recruiting-nav li").addClass('current');
			$(this).parent().siblings().removeClass("current");

			sliderPos = $(this).parent().prevAll("#currently-recruiting-nav li").length;

			$("#slides").stop().animate( {left:-sliderPositions[sliderPos]+'px'}, 850 );

			e.preventDefault();
		});

		$("#currently-recruiting-nav ul li:first").addClass("current").siblings();
		$("#currently-recruiting").parents( "div:first" ).mouseover( function(){ clearInterval( sliderIntervalId ) } );
		$("#currently-recruiting").parents( "div:first" ).mouseout( function(){ sliderIntervalId = setInterval( "SliderNextSlide()", sliderInterval );} );

		$("#slides").draggable({ axis: 'x', stop: function() {

			currentPos = parseInt($("#slides").css( "left" ).replace("px",""));
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
			$($("#currently-recruiting-nav ul li a")[newPos]).triggerHandler("click");
		}});
		sliderIntervalId = setInterval( "SliderNextSlide()", sliderInterval );
	});
}
function SliderNextSlide()
{
	sliderPos++;
	if( sliderPos >= $("#currently-recruiting-nav li").length )
	{
		sliderPos = 0;
	}
	$($("#currently-recruiting-nav ul li a")[sliderPos]).triggerHandler("click");
}