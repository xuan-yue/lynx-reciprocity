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
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
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


$('.collapse').on('shown.bs.collapse', function (e) {
    alert('Event fired on #' + e.currentTarget.id);
})

// Ask button scroll and fix 
var num = 355; //number of pixels before modifying styles

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > num) {
        $('#ask_button').addClass('fixed');
    } else {
        $('#ask_button').removeClass('fixed');
    }
});

// Event Ask and People Tabs
function openContent(evt, contentName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    document.getElementById(contentName).style.display = "block";
}

// $(document).ready(function() {
//         document.getElementById('focusmeplease').focus();
// });

$('#id_of_textarea').keypress(function(e){
      if(e.which == 13){
           $(this).closest('form').submit();
       }
    });