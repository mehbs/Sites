function myOpenPopup() {
 		runtimePopup("<iframe src='home.html' width='0' height='0' " +
			"style='border: 0px; margin: 0px; padding: 0px;'></iframe>", closePopUp);
 	}
	
	function myOpenPopup1() {
 		runtimePopup("<iframe src='Summary.html' width='0' height='0' " +
			"style='border: 0px; margin: 0px; padding: 0px;'></iframe>", closePopUp);
 	}

	function closePopUp() {
		$(".messagePopup").popup("close");
	}
	
	function runtimePopup(markup, popupafterclose) {
		var template = "<div data-role='popup' class='messagePopup'><span> " + markup + " </span> </div>";

 		popupafterclose = popupafterclose ? popupafterclose : function () { };

 		$.mobile.ajaxEnabled = false;
 		$.mobile.activePage.append(template).trigger("create");

 		$.mobile.activePage.find(".messagePopup").on({ 
 			popupbeforeposition: function () {
 				var size = scale(800, 200, 0, 1),
                w = screen.width,
                h = screen.height;

 				$(this).find("iframe")
                .attr("width", w)
                .attr("height", h);
 			},
 			popupafterclose: function () {
 				$(this).find("iframe")
                .attr("width", 0)
                .attr("height", 0);
 			}
 		});
		 

 		$.mobile.activePage.find(".messagePopup").popup().popup("open").bind({
 			popupafterclose: function () {
 				$(this).unbind("popupafterclose").remove();
 				popupafterclose(); 
 				$.mobile.ajaxEnabled = true;
				}  
 		});
 	}


 	function scale(width, height, padding, border) {
 		var scrWidth = $(window).width() - 30,
			scrHeight = $(window).height() - 30,
			ifrPadding = 2 * padding,
			ifrBorder = 2 * border,
			ifrWidth = width + ifrPadding + ifrBorder,
			ifrHeight = height + ifrPadding + ifrBorder,
			h, w;

 		if (ifrWidth < scrWidth && ifrHeight < scrHeight) {
 			w = ifrWidth;
 			h = ifrHeight;
 		} else if ((ifrWidth / scrWidth) > (ifrHeight / scrHeight)) {
 			w = scrWidth;
 			h = (scrWidth / ifrWidth) * ifrHeight;
 		} else {
 			h = scrHeight;
 			w = (scrHeight / ifrHeight) * ifrWidth;
 		}

 		return {
 			'width': w - (ifrPadding + ifrBorder),
 			'height': h - (ifrPadding + ifrBorder)
 		};
 	};
