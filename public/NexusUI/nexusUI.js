// Jesse Allison 2011
// nexus - shared utility functions for javascript UI objects



function Point(x,y){
	this.x = x;
	this.y = y;
}

function CanvasOffset(left, top) {
	this.left = left;
	this.top = top;
}

function Polar(radius, theta) {
	this.radius = radius;
	this.theta = theta;
}


// FYI, if the style.display is set to 'none' or style.visibility is set to 'hidden'
// you will not be able to detect the position of the element properly.  
// You may need to detect the position after making visible, or detect the position
// when instantiated, then set the display to none.  
function findPosition( oElement ) {
  if( typeof( oElement.offsetParent ) != 'undefined' ) {
    for( var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent ) {
      posX += oElement.offsetLeft;
      posY += oElement.offsetTop;
    }
		var canvas_offset = new CanvasOffset(posX,posY);
    return canvas_offset;
  } else {
		var canvas_offset = new CanvasOffset(oElement.x, oElement.y);
    return canvas_offset;
  }
}

var is_touch_device = ('ontouchstart' in document.documentElement)?true:false;



// document.addEventListener("mouseup", document_release.release, false);
/*
function document_release() {
	this.delegates = new Array();
	this.delegate_functions = new Array();
	var self = this;
	
	this.add_delegate = function(ui_instance, function_to_call) {
		self.delegates.push(ui_instance);
		self.delegate_functions.push(function_to_call);
	}
	
	this.release = function(e){
		for(i=0;i==self.delegates.length;i++) {
			window["functionName"](arguments);
			window[self.delegates[i]][self.delegate_functions[i]](e);
		}
	}
	
}

*/

		// ajax_send is the function to send info back to the server. 
		// it requires a command and an osc_name (by default it is the name of the canvas id) and data
		// an id can be sent or left out.  the id is used for multiple instances of the same type of UI
		// e.g. dial.1, dial.2, etc.  
window.ajax_send = function (command, osc_name, id, data) {
	if (id) {
		new Ajax.Request(command, {parameters: {osc_name: osc_name, id: id, data: data}});
	} else {
		new Ajax.Request(command, {parameters: {osc_name: osc_name, data: data}});
	}
}

window.aural_sender = function (command, param, data) {
	var request;
		request = $.ajax({
		  type: "POST",
		  url: command,
		  data: ""+param + "=" + data
		});
	}

window.nexus_ajax_get = function (command, osc_name, id, data, callback) {
	var request;
	if (id) {
		request = $.ajax({
		  type: "POST",
		  url: command,
		  data: "osc_name=" + osc_name + "&id=" + id + "&data=" + data,
			success: callback
		});
	} else {
		request = $.ajax({
		  type: "POST",
		  url: command,
		  data: "osc_name=" + osc_name + "&data=" + data,
			success: callback
		});
	}
}

	// nexus_send is the function to send osc commands as urls to be captured by the browser.

window.nexus_send = function (command, osc_name, id, data) {
	if (id) {
		
	} else {
		
	}
}


function getCursorPosition(e, canvas_offset) {
	var x;
  var y;
  if (e.pageX != undefined && e.pageY != undefined) {
		x = e.pageX;
		y = e.pageY;
  } else {
		x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
		y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
  }
	x -= canvas_offset.left;
  y -= canvas_offset.top;
	var click_position = new Point(x,y);
	return click_position;
}

		// Works great for one touch per UI element (does not handle multi-touch on a single UI)
function getTouchPosition(e, canvas_offset) {
	var x;
	var y;
	x = e.targetTouches[0].pageX;
	y = e.targetTouches[0].pageY;
	x -= canvas_offset.left;
  y -= canvas_offset.top;
	var click_position = new Point(x,y);
	return click_position;
}




//  :: NEXUS Utility Functions ::  //

function to_cartesian(radius, angle){
	var cos = Math.cos(angle);
	var sin = Math.sin(angle);
	var point = new Point(radius*cos, radius*sin*-1);
	return point;
}

function to_polar(x,y){
	var r = Math.sqrt(x*x + y*y);

	var theta = Math.atan2(y,x);
	if (theta < 0.) {
		theta = theta + (2 * Math.PI);
	}
	var polar = new Polar(r, theta);
	
	return polar;
}

function clip(value, low, high) {
	var clipped_value = Math.min(high, Math.max(low, value));
	return clipped_value;
}

function throttle(func, wait) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        if (!timeout) {
            // the first time the event fires, we setup a timer, which 
            // is used as a guard to block subsequent calls; once the 
            // timer's handler fires, we reset it and create a new one
            timeout = setTimeout(function() {
                timeout = null;
                func.apply(context, args);
            }, wait);
        }
    }
}



		// To use, just set the timer on the first event, then call it again to return the duration.  
		//		nexusEventTimer();
		//		var delta_time = nexusEventTimer();
		//
function nexusEventTimer() {
	var new_event_time = +new Date();		// timestamp in ms
	var event_duration = new_event_time - nexus_event_time;
	nexus_event_time = new_event_time;
	return event_duration;
}

		// Play a sound by passing in the sound loaded in an audio tag such as: 
		// 		<audio id="audio1" src="/Bark.aif" preload="auto" autobuffer></audio>
		// Android doesn't support this yet...
		//
function playSound(soundobj, vol) {
  var thissound=document.getElementById(soundobj);
	thissound.pause();
	if (vol > 0.0) {
		thissound.volume = vol;		// Unfortunately Volume is not settable on iOS Devices!!!
		thissound.play();
	}
}

window.saveDataURL = function (canvas, user_id) {
		var image = canvas.toDataURL("image/png");
				// Older Version
		//var request = new XMLHttpRequest();
		//request.open("POST",'submit_picture',false);
		//request.setRequestHeader('Content-Type', 'application/upload');
		//request.send( image ); 
				// Pretty new jQuery version
		var request;
		request = $.ajax({
		  type: "POST",
		  url: 'submit_picture',
		  data: "user_id=" + user_id + "&dataURL=" + image
		});
}

				// UGhhh Android toDataURL Workaround. Just call to see if it works. 
				// I added in todataurl.js to add functionality to android browsers. . .
function supportsToDataURL()
{
	if(!supports_canvas())
	{
		return false;
	}
 
	var c = document.createElement("canvas");
	var data = c.toDataURL("image/png");
	return (data.indexOf("data:image/png") == 0);
}

function text(context, text, position) {
	if (!position) {
		position = [10 , 10];
	}
	with(context) {
		beginPath();
			// fillStyle = "#000";
			font = "bold 12px sans-serif";
			fillText(text,position[0],position[1]);
		closePath();
	}
}
