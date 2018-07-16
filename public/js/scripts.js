// function addBox()
// {
//     var boxesDiv = document.getElementById("name_boxes");
//     var newBox = document.createElement("input");
//     var numberNames = document.getElementsByName("names[]").length

//     newBox.type = "text";
//     newBox.name = "names[]";
//     newBox.setAttribute("id", numberNames.toString());
//     newBox.setAttribute("onchange", "addBox();")

//     boxesDiv.appendChild(newBox);
//     //document.getElementById("name_boxes").innerHTML += '<input type="text" name="names[]" onchange="addBox();"><br>';
// }
function load()
{
    var boxDiv = document.getElementById("name_boxes");
    var newBox = document.createElement("input");
    newBox.type = "text";
    newBox.name = "names[]";
    newBox.className = "txtbox";
    newBox.setAttribute("id", "0");
    newBox.addEventListener("keydown", eventAddBox, true);
    boxDiv.appendChild(newBox);
}

function eventAddBox()
{
    var numBoxes = document.getElementsByName("names[]").length;
    this.removeEventListener("keydown", eventAddBox, true);

    var boxDiv = document.getElementById("name_boxes");
    var newBox = document.createElement("input");
    newBox.type = "text";
    newBox.name = "names[]";
    newBox.className = "txtbox";
    newBox.setAttribute("id", numBoxes.toString());
    newBox.addEventListener("keydown", eventAddBox, true);
    boxDiv.appendChild(newBox);
}