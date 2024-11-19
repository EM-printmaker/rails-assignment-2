window.addEventListener("load",function(){
  function previewImage(obj)
    {
      var fileReader = new FileReader();
      fileReader.onload = function() {
      var element = document.getElementById('imagePreview');
      element.src = fileReader.result;
          }
          fileReader.readAsDataURL(obj.files[0]);
      };
  
  const imageInput = document.querySelector('#imageInput');
  imageInput.addEventListener('change', function() {
    previewImage(this);
  });
});