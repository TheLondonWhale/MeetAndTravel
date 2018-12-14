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
	var usertime = $('#usertime').data('usertime');

   console.log(data);
	 console.log(currentuser);
	 console.log(usertime);

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
            console.log(myLatLng);
            myLatLng = {lat:position.coords.latitude, lng:position.coords.longitude};
            console.log(myLatLng);
            var marker = new google.maps.Marker({
                  position: myLatLng,
                  map: map,
                  title: 'Géolocalisation',
                  icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
              });
            map.setZoom(12);
        });
    }

    for (var i = 0, length = data.length; i < length; i++) {
      var j = data[i],
          latLng = new google.maps.LatLng(j.latitude, j.longitude);
					if (j.id == currentuser) {
            var myposition = new google.maps.Marker({
              position: latLng,
              map: map,
              title: "Ma position",
              icon: 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
            });
					map.panTo(new google.maps.LatLng(j.latitude, j.longitude));}
						else {
							addMarker(latLng, j);
						}
      // Creating a marker and putting it on the map

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
              <p class="customer-text"><b>Connecté ici le : </b>${usertime}</p>
              <a class="btn btn-primary justify-content-center" rel="nofollow" data-method="post" href="/conversations?recipient_id=${j.id}&sender_id=${currentuser}">Envoyer un message</a>
								</div>
              `)
          infoWin.open(map, marker);
        });
      }
    }
}

function initMap2(){
  var lat = document.getElementById('place_latitude').value;
  var lng = document.getElementById('place_longitude').value;

	var geolat = 0
	var geolng = 0
	var myGeoCoords = new google.maps.LatLng(lat, lng);

  // if not defined create default position
  if (!lat || !lng){
      lat=40.712784;
      lng=-74.005941;
      document.getElementById('place_latitude').value = lat;
      document.getElementById('place_longitude').value = lng;
  }

  var myCoords = new google.maps.LatLng(lat, lng);

  var mapOptions = {
  center: myCoords,
  zoom: 4
  };

  var map = new google.maps.Map(document.getElementById('map2'), mapOptions);

  var marker = new google.maps.Marker({
      title: 'Ma position',
      icon: 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
      map: map,
      draggable: true,
			position: myCoords
  });

  var infoWin = new google.maps.InfoWindow();

  // Geolocation code
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
          geolat = position.coords.latitude;
          geolng = position.coords.longitude;
          myGeoCoords= {lat:position.coords.latitude, lng:position.coords.longitude}
          var geomark = new google.maps.Marker({
                position: myGeoCoords,
                map: map,
                title: 'Ma géolocalisation',
                icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                animation: google.maps.Animation.DROP,
            });
          map.setZoom(14);
					// When clicked, InfoWindow show where you are
					geomark.addListener('click', function(){
						infoWin.setContent(`Ta géolocalisation`)
						infoWin.open(map, geomark);
					});
			});
	}

  // when input values change call refreshMarker
  document.getElementById('place_latitude').onchange = refreshMarker;
  document.getElementById('place_longitude').onchange = refreshMarker;
  // when marker is dragged update input values
  marker.addListener('drag', function() {
      latlng = marker.getPosition();
      newlat=(Math.round(latlng.lat()*1000000))/1000000;
      newlng=(Math.round(latlng.lng()*1000000))/1000000;
      document.getElementById('place_latitude').value = newlat;
      document.getElementById('place_longitude').value = newlng;
  });
	// When drag ends, center (pan) the map on the marker position
  marker.addListener('dragend', function() {
      map.panTo(marker.getPosition());
  });

	marker.addListener('click', function(){
	 infoWin.setContent(`Les voyageurs te voient ici !`)
	 infoWin.open(map, marker);
 	});

	function refreshMarker(){
	     lat = document.getElementById('place_latitude').value;
	     lng = document.getElementById('place_longitude').value;
	     var myCoords = new google.maps.LatLng(lat, lng);
	     marker.setPosition(myCoords);
	     map.setCenter(marker.getPosition());
	 }

	 document.getElementById("geobut").onclick = function(){
	   map.panTo(new google.maps.LatLng(geolat, geolng));
	 }

	 document.getElementById("locbut").onclick = function(){
	   map.panTo(new google.maps.LatLng(lat, lng));
	 }
	}
