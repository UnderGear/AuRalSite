// nexus MultiSlider
//	Jesse Allison 2012
//

// TODO: add Clip


function multiSlider(draw_canvas, ajax_command, multiSlider_id) {
	
	this.canvas_id = draw_canvas;
	this.multiSlider_id = multiSlider_id;
	this.ajax_command = ajax_command;
	this.osc_name = draw_canvas;
	var self = this;
	var canvas = document.getElementById(self.canvas_id);
	var canvas_height = canvas.height;
	var canvas_width = canvas.width;
	var canvas_offset = findPosition(canvas);
	
	this.slider_number = 20;
	var multi_values = [0, 0.05, 0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95];
	var multi_val = 0.;
	this.line_color = "#000";
	this.fill_color = "#AAA";
	this.line_accent = "#ff7f24";
	var multi_clicked = 0;
	var multi_slider_width = canvas_width/self.slider_number;
	var clicked = 0;
	
	this.getCursorPosition = getCursorPosition;
	this.getTouchPosition = getTouchPosition;
	this.ajax_send = ajax_send;
	this.throttle = throttle;
	this.clip = clip;		

	init();

	function init() {
		if (!self.ajax_command) {
			self.ajax_command = "multiSlider";
		}	
		
		multi_draw();
		
		if(is_touch_device) {
			canvas.ontouchstart = multi_sliderOnTouchStart;
			canvas.ontouchmove = self.throttle(multi_sliderOnTouchMove, 20);
			canvas.ontouchend = multi_sliderOnMouseup;
		} else {
			canvas.addEventListener("mousedown", multi_sliderOnMousedown, false);
			canvas.addEventListener("mousemove", self.throttle(multi_sliderOnMousemove, 20), false);
			canvas.addEventListener("mouseup", multi_sliderOnMouseup, false);
			document.addEventListener("mouseup", multi_sliderOnMouseup, false);
		}
	}

	function multi_draw()
	{
		var multiSlider_context = canvas.getContext("2d");
		
	  var multi_aspect = canvas_width/canvas_height;
		var i;
		var line_y, line_x;
		
		with(multiSlider_context) {
			clearRect(0, 0, canvas_width, canvas_height);
	    
			fillStyle = self.fill_color;
			fillRect(0, 0, canvas_width, canvas_height);
	    
			// beginPath();
				for(i=0; i<self.slider_number; i++) {
					line_y = multi_values[i]*canvas_height;
					line_x = i*multi_slider_width;
					
					beginPath();
					strokeStyle = self.line_accent;
					lineWidth = 4.0;
					moveTo(line_x,line_y);
					lineTo(line_x + multi_slider_width, line_y);
					stroke();
					closePath();
					
					beginPath();
					strokeStyle = self.line_color;
					lineWidth = 2.0;
					moveTo(line_x,line_y - 0);
					lineTo(line_x + multi_slider_width, line_y - 0);
					stroke();
					closePath();
				}
			// closePath();
		}
	}


	function multi_sliderOnMousedown(e) {
		multi_clicked = 1;
		multi_sliderOnMousemove(e);
	}

	function multi_sliderOnTouchStart(e) {
			multi_clicked = 1;
			multi_sliderOnTouchMove(e);
	}

	function multi_sliderOnMouseup(e) {
		if (multi_clicked == 1) {
			multi_clicked = 0;
		}
	}

	function multi_sliderOnMousemove(e) {
		if(multi_clicked == 1 ) {
			var click_location = self.getCursorPosition(e, canvas_offset);
	
			clicked = Math.floor(click_location.x / multi_slider_width);
		
			if (multi_values[clicked] != (click_location.y / canvas_height)) {
				multi_values[clicked] = (click_location.y / canvas_height);
				multi_val = clicked;
				multi_draw();
				self.ajax_send(self.ajax_command, self.osc_name, self.multiSlider_id, 'slider_number=' + encodeURIComponent(clicked) + '&slider_value=' + encodeURIComponent((1.-multi_values[clicked]).toFixed(2)));
			}
		}
	}

	function multi_sliderOnTouchMove(e) {
		if(multi_clicked == 1) {
			var click_location = self.getTouchPosition(e, canvas_offset);
			
			clicked = Math.floor(click_location.x / multi_slider_width);
	
			if (multi_values[clicked] != (click_location.y / canvas_height)) {
				multi_values[clicked] = (click_location.y / canvas_height);
				multi_val = clicked;
				multi_draw();
				self.ajax_send(self.ajax_command, self.osc_name, self.multiSlider_id, 'slider_number=' + encodeURIComponent(clicked) + '&slider_value=' + encodeURIComponent((1.-multi_values[clicked]).toFixed(2)));
			}
		}
	}
}