// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require turbolinks
//= require_tree .


/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */

function openNav() {
	if (document.getElementById("mySidenav").style.width == 0 || document.getElementById("mySidenav").style.width == "0px")
	{
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.getElementById("nav").style.marginLeft = "250px";
	}else{
		closeNav();
	}
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
	document.getElementById("nav").style.marginLeft = "0";
}




$(document).on("focus", "[data-behaviour~='datepicker']", function(e) {
	console.log("here")
  $(this).datepicker;
  return {
    format: "dd-mm-yyyy",
    autoclose: true
  };
});