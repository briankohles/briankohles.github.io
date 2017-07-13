function hideImage() {
  document.getElementById("full").src = "";
}

function showImage(img) {
  var src = img.src;
  var largeSrc = src.replace('small', 'large');
  document.getElementById('full').src = largeSrc;
}