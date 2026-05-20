const fileInput = document.getElementById("fileInput");
const previewImage = document.getElementById("previewImage");
const resultImage = document.getElementById("resultImage");

function goToDashboard(){

  window.location.href =
    "Dsidebar.html";
  
  }
  /* OPEN EXPLORER */

  function openExplorer(){

    fileInput.click();
  }

  /* IMAGE UPLOAD */

  fileInput.addEventListener("change", function(){

    const file = this.files[0];

    if(file){

      const reader = new FileReader();

      reader.onload = function(e){

        previewImage.src = e.target.result;

        resultImage.src = e.target.result;
      }

      reader.readAsDataURL(file);
    }

  });

  /* REMOVE IMAGE */

  function removeImage(event){

    event.stopPropagation();

    // Reset Images
    previewImage.src = defaultImage;

    resultImage.src = defaultImage;

    // Optional Text
    document.getElementById("prompt").value = "";
}
  /* QUICK PROMPTS */

  function setPrompt(text){

    document.getElementById("prompt").value = text;
  }

  /* GENERATE DESIGN */

  function generateDesign(){

    alert("AI Design Generated Successfully!");
  }
  function showResult(imageURL){

    const resultImage = document.getElementById("resultImage");
    const placeholder = document.getElementById("resultPlaceholder");

    resultImage.src = imageURL;

    // hide placeholder after generation
    placeholder.style.display = "none";
}