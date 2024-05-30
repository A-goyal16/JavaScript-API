function validateForm() {
    var name = document.getElementById("name").value;
    var section = document.getElementById("section").value;
    var genderOptions = document.getElementsByClassName("gender");
    var genderSelected = false;
    
    for (var i = 0; i < genderOptions.length; i++) {
        if (genderOptions[i].checked) {
            genderSelected = true;
            break;
        }
    }
    if (name === "") {
        alert("Please enter name.");
        return false;
    }
    if (section === "") {
        alert("Please enter section.");
        return false;
    }
    if (!genderSelected) {
        alert("Please select gender.");
        return false;
    }
    return true;
}

function validateSection(event) {
      const input = event.target;
      const value = input.value.trim();
      const isValid = /^\d*$/.test(value);

      if (!isValid) {
        input.value = value.slice(0, -1);
      }
    }






























