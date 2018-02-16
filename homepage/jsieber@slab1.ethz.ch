<!DOCTYPE html>
<html>
<title>MobChain Demo App</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="#report" class="w3-bar-item w3-button w3-padding-large w3-hide-small">REPORT</a>
    <a href="#about" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT</a>
  </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#report" class="w3-bar-item w3-button w3-padding-large">REPORT</a>
  <a href="#about" class="w3-bar-item w3-button w3-padding-large">ABOUT</a>
</div>

<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Band Section -->
  <div class="w3-grey">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h1 class="w3-center w3-text-black">MobChain Demo</h1>
      <p class="w3-opacity w3-center"><i>Maybe need some text here</i></p><br>

      <ul class="w3-ul w3-border w3-white w3-text-grey">
          <li class="w3-padding">Start Point <span style="display:inline-block; width:5mm;"></span>
          <select name="start">
            <option value="zurich">Zurich</option>
            <option value="bern">Bern</option>
            <option value="basel">Basel</option>
            <option value="stgallen">St. Gallen</option>
          </select></li>
        <li class="w3-padding">End Point <span style="display:inline-block; width:5mm;"></span>
          <select name="end">
            <option value="zurich">Zurich</option>
            <option value="bern">Bern</option>
            <option value="basel">Basel</option>
            <option value="stgallen">St. Gallen</option>
          </select></li>
        <li class="w3-padding">Car <span style="display:inline-block; width:5mm;"></span>
          <select name="car">
            <option value="zurich">Thomas' car</option>
            <option value="bern">Yannik's car</option>
          </select></li>
      </ul>

      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <p><b>Request MobCoins</b></p>
            <p class="w3-opacity">Fri 27 Nov 2016</p>
            <p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Request MobCoins</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <p><b>Get Car</b></p>
            <p class="w3-opacity">Sat 28 Nov 2016</p>
            <p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Get Car</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <p><b>Live View</b></p>
            <p class="w3-opacity">Sun 29 Nov 2016</p>
            <p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
            <p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!--Report-->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="report">
    <h2 class="">Report</h2>
    <p class="w3-opacity"><a href="https://www.google.ch" onFocus="if(this.blur)this.blur()">Download Link</a></p>
  </div>

  <!--About-->
  <div class="w3-grey" id="about">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-center">ABOUT</h2>
      <p class="w3-justify">We did blah blah blah blah.</p>
    </div>
  </div>

  <!-- Ticket Modal -->
  <div id="ticketModal" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('ticketModal').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">&times;</span>
        <h2 class="w3-wide"><i class="fa fa-suitcase w3-margin-right"></i>Tickets</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-shopping-cart"></i> Tickets, $15 per person</label></p>
        <input class="w3-input w3-border" type="text" placeholder="How many?">
        <p><label><i class="fa fa-user"></i> Send To</label></p>
        <input class="w3-input w3-border" type="text" placeholder="Enter email">
        <button class="w3-button w3-block w3-teal w3-padding-16 w3-section w3-right">PAY <i class="fa fa-check"></i></button>
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('ticketModal').style.display='none'">Close <i class="fa fa-remove"></i></button>
        <p class="w3-right">Need <a href="#" class="w3-text-blue">help?</a></p>
      </div>
    </div>
  </div>
<!-- End Page Content -->
</div>
<!-- Add Google Maps -->
<!-- <div id="googleMap" style="height:400px;" class="w3-grayscale-max"></div> -->
<!-- <script> -->
<!-- function myMap() { -->
  <!-- myCenter=new google.maps.LatLng(41.878114, -87.629798); -->
  <!-- var mapOptions= { -->
    <!-- center:myCenter, -->
    <!-- zoom:12, scrollwheel: false, draggable: false, -->
    <!-- mapTypeId:google.maps.MapTypeId.ROADMAP -->
  <!-- }; -->
  <!-- var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions); -->

  <!-- var marker = new google.maps.Marker({ -->
    <!-- position: myCenter, -->
  <!-- }); -->
  <!-- marker.setMap(map); -->
<!-- } -->
<!-- </script> -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script> -->
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-center w3-opacity w3-light-grey w3-xlarge">
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>