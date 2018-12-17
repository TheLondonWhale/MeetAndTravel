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
//= require js/script
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
    zoom: 8
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
}

// carte index
function initializeMap() {

  var data = $('#map-canvas').data('users');
	var currentuser = $('#currentuser').data('currentuser');
	var usertime = $('#usertime').data('usertime');
	var avatar = $('#avatar').data('avatar');

    var myLatLng = {lat: 50.63, lng: 3.06};

    var mapOptions = {
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(50.63,3.06)
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var infoWin = new google.maps.InfoWindow();

    // Geolocation code

    for (var i = 0, length = data.length; i < length; i++) {
      var j = data[i],
          latLng = new google.maps.LatLng(j.latitude, j.longitude);
					if (j.id == currentuser) {
						if (j.latitude !== null && j.longitude !== null) {
							var myposition = new google.maps.Marker({
	              position: latLng,
	              map: map,
	              title: "Ma position",
	              icon: 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
	            });
							map.panTo(new google.maps.LatLng(j.latitude, j.longitude));
						}
						else {
							map.panTo(new google.maps.LatLng(myLatLng));
						}
					}
						else {
							addMarker(latLng, j);
						}
      // Creating a marker and putting it on the map

    }

		function addMarker(latLng, j){
			console.log(j.latitude);;
			if (j.latitude == 0.0 && j.longitude == 0.0) {
				var marker = new google.maps.Marker({});
				console.log('zero');
			} else {
				var marker = new google.maps.Marker({
				position: latLng,
				map: map,
				title: j.name,
			});
      if (j){
        marker.addListener('click', function(){
          infoWin.setContent(`

							<p><h5 class="text-center" style="color:#ff6b6b;">${j.firstname}</h5></p>
              <p class="customer-text text-center"><b>Connecté ici le : </b>${usertime}</p>
							<p class="customer-text text-center"><a href="/users/registrations/${j.id}"><span class="fa fa-eye"></span> <strong>Voir son profil</strong></a></p>
              <p class="customer-text text-center"><a rel="nofollow" data-method="post" href="/conversations?recipient_id=${j.id}&sender_id=${currentuser}"><span class="fa fa-envelope"></span> <strong>Envoyer un message</strong></a></p>

              `)
          infoWin.open(map, marker);
        });
      }
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
      title: 'Définr ma position sur le site',
      map: map,
      position: myCoords,
      draggable: true,
  });

  var infoWin = new google.maps.InfoWindow();

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
      console.log(marker.getPosition());
  });

  marker.addListener('click', function(){
    infoWin.setContent(`les uatres te voient là!`)
    infoWin.open(map, marker);
  });

  // Geolocation code
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
          geolat = position.coords.latitude;
          geolng = position.coords.longitude;
          myGeoCoords= {lat:position.coords.latitude, lng:position.coords.longitude};
          map.setZoom(14);
      });
  }

  // when input values change call refreshMarker
  document.getElementById('place_latitude').onchange = refreshMarker;
  document.getElementById('place_longitude').onchange = refreshMarker;

  // when marker is dragged update input values

  function refreshMarker(){
      lat = document.getElementById('place_latitude').value;
      lng = document.getElementById('place_longitude').value;
      var myCoords = new google.maps.LatLng(lat, lng);
      marker.setPosition(myCoords);
      map.setCenter(marker.getPosition());
  }

  document.getElementById("geobut").onclick = function(){
    map.panTo(new google.maps.LatLng(geolat, geolng));

    document.getElementById('place_latitude').value = geolat;
    document.getElementById('place_longitude').value = geolng;

    var newmarker = new google.maps.Marker({
          position: myGeoCoords,
          map: map,
          title: 'Ma géolocalisation',
          animation: google.maps.Animation.DROP,
          draggable: true
      });
      marker.setMap(null);
    newmarker.addListener('drag', function() {
        latlng = newmarker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('place_latitude').value = newlat;
        document.getElementById('place_longitude').value = newlng;
    });

    // When drag ends, center (pan) the map on the marker position
    newmarker.addListener('dragend', function() {
        map.panTo(newmarker.getPosition());
        console.log(newmarker.getPosition());
    });

    newmarker.addListener('click', function(){
      infoWin.setContent(`les uatres te voient là!`)
      infoWin.open(map, newmarker);
    });

  }

	document.getElementById("ghost").onclick =  function(){
    lat = undefined;
    lng = undefined;
    document.getElementById('place_latitude').value = lat;
    document.getElementById('place_longitude').value = lng;
		console.log(lat);
		alert("Tu es en mode fantôme, indique ton mot de passe pour valider les changements")
  }
}
