  var imageInput = document.querySelector('#imageInput');
  imageInput.addEventListener('change', function() {
    previewImage(this);
  });
  
  function previewImage(obj)
    {
      var fileReader = new FileReader();
      fileReader.onload = function() {
      var element = document.getElementById('imagePreview');
      element.src = fileReader.result;
          }
          fileReader.readAsDataURL(obj.files[0]);
      };
