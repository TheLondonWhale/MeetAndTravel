// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require js/bootstrap
//= require js/bootstrap.min
//= require js/contact
//= require js/jquery-3.2.1.min
//= require js/jquery.magnific-popup
//= require js/popper.min
//= require js/script
//= require js/swiper.min
//= require js/validate
//= require_tree .


// caroussel

jQuery(document).ready(function ($) {

	var slideCount = $('#slider ul li').length;
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;

	$('#slider').css({ width: slideWidth, height: slideHeight });

	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });

    $('#slider ul li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    $('a.control_prev').click(function () {
        moveLeft();
    });

    $('a.control_next').click(function () {
        moveRight();
    });

});

// carte show tips
function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
    console.log('map');
}

// carte index
function initializeMap() {

  var data = $('#map-canvas').data('users');
	var currentuser = $('#currentuser').data('currentuser');

   console.log(data);
	 console.log(currentuser);

    var myLatLng = {lat: 50.63, lng: 3.06};

    var mapOptions = {
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(50.63,3.06)
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var infoWin = new google.maps.InfoWindow();

    // Geolocation code
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            map.panTo(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
            console.log(myLatLng);
            myLatLng = {lat:position.coords.latitude, lng:position.coords.longitude};
            console.log(myLatLng);
            var marker = new google.maps.Marker({
                  position: myLatLng,
                  map: map,
                  title: 'Ma position',
                  icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
              });
            map.setZoom(12);
        });
    }

    for (var i = 0, length = data.length; i < length; i++) {
      var j = data[i],
          latLng = new google.maps.LatLng(j.latitude, j.longitude);
      // Creating a marker and putting it on the map
          addMarker(latLng, j);
    }

    function addMarker(latLng, j){
      var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        title: j.firstname,
      });
      if (j){
        marker.addListener('click', function(){
          infoWin.setContent(`
								<div class='follow-img'>
							<h5 class="text-center" style="color:#ff6b6b;">${j.firstname}</h5>
              <p class="customer-text"><b>Connecté ici le : </b>${j.updated_at}</p>
              <a class="btn btn-primary justify-content-center" rel="nofollow" data-method="post" href="/conversations?recipient_id=${j.id}&sender_id=${currentuser}">Envoyer un message</a>
								</div>
              `)
          infoWin.open(map, marker);
        });
      }
    }
}
