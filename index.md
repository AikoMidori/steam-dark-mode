<head><link rel="stylesheet" href="index.css"></head>

# [Download Here](https://github.com/AikoMidori/steam-dark-mode/archive/master.zip)
To automatically install, simply run the installer.bat.

### Manual Installation
Windows
You go to "C:/Program files (86)/Steam/Skins/Metro/resource" and put it in, click replace, restart steam and all done!

macOS
Right click on your Finder, select "Go to Folder..." and put this in the search path:
~/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/skins
Open Metro folder, go to resource folder, and replace just like Windows.

# Screenshots

<div class="container">
  <div class="mySlides">
    <div class="numbertext">1 / 6</div>
    <img src="https://i.imgur.com/KIcOaZs.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
    <img src="https://i.imgur.com/n4UqKX4.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
    <img src="https://i.imgur.com/Tf0xrci.png" style="width:100%">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
    <img src="https://i.imgur.com/HT0b6Yd.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
    <img src="https://i.imgur.com/MRApRGh.png" style="width:100%">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
    <img src="https://i.imgur.com/5WOVQfo.png" style="width:100%">
  </div>
    
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/KIcOaZs.png" style="width:100%" onclick="currentSlide(1)" alt="Sneak Peak">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/n4UqKX4.png" style="width:100%" onclick="currentSlide(2)" alt="A Glimpse">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/Tf0xrci.png" style="width:100%" onclick="currentSlide(3)" alt="Stop peeking you ....!">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/HT0b6Yd.png" style="width:100%" onclick="currentSlide(4)" alt="it's blue da ba dee da ba daa..">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/MRApRGh.png" style="width:100%" onclick="currentSlide(5)" alt="Nothing to see here.">
    </div>    
    <div class="column">
      <img class="demo cursor" src="https://i.imgur.com/5WOVQfo.png" style="width:100%" onclick="currentSlide(6)" alt="Almost there.">
    </div>
  </div>
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>