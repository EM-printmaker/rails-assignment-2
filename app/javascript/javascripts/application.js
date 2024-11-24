window.addEventListener("load",function(){
  // クリックして非表示
  var hides = document.querySelectorAll(".hide");
  
  hides.forEach(function(hide) {
      hide.addEventListener("click", function() {
          this.style.transition = "opacity 0.2s";
          this.style.opacity = 0;
      });
  });
});
