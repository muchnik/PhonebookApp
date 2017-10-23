function createNewPhoneForm() {

    // Create Label
    var labelTd = document.createElement("td");
    var label = document.createTextNode("Add new number");
    labelTd.id = "labelTd";
    labelTd.appendChild(label);

    //Create <td> for details
    var tdDetails = document.createElement("td");
    tdDetails.id = "td_details";

    //Create <select> phone type;
    var phoneTypes = [
        {
            name: "MAIN",
            title: "Main"
        }, {
            name: "MOBILE",
            title: "Mobile"
        }, {
            name: "WORK",
            title: "Work"
        }
    ];

    var phoneType = document.createElement("select");
    phoneType.id = "type";
    phoneType.name = "type";
    phoneType.setAttribute("class", "form-control");

    for (var i = 0; i < phoneTypes.length; i++) {
        var option = document.createElement("option");
        option.value = phoneTypes[i].name;
        option.text = phoneTypes[i].title;
        phoneType.appendChild(option);
    }

    //Create id for phone number
    var numId = document.createElement("input");
    numId.setAttribute('type', "hidden");
    numId.setAttribute('name', "id");
    numId.setAttribute('id', "id");
    numId.setAttribute('value', "0");

    //Create <input> for phone number
    var phoneNumber = document.createElement("input");
    phoneNumber.setAttribute('type', "text");
    phoneNumber.setAttribute('name', "phoneNumber");
    phoneNumber.setAttribute('class', "form-control");
    phoneNumber.setAttribute('placeholder', "number");
    phoneNumber.setAttribute('required', "required");
    phoneType.required = true;

    // Create cancel button
    var buttonLabel = document.createTextNode("Cancel");
    var cancel = document.createElement("button");
    cancel.setAttribute('type', "button");
    cancel.setAttribute('value', "Cancel");
    cancel.setAttribute('class', "btn btn-default btn-sm new_button_cancel");
    cancel.setAttribute("onclick", "deleteForm()");
    cancel.appendChild(buttonLabel);

    // Create Add button
    var buttonLabelAdd = document.createTextNode("Submit");
    var add = document.createElement("input");
    add.setAttribute('type', "submit");
    add.setAttribute('value', "Add");
    add.setAttribute('class', "btn btn-default btn-sm new_button_cancel");
    add.appendChild(buttonLabelAdd);

    // Append all elements to td
    tdDetails.appendChild(numId);
    tdDetails.appendChild(phoneType);
    tdDetails.appendChild(phoneNumber);
    tdDetails.appendChild(add);
    tdDetails.appendChild(cancel);

    // Appends td -> tr
    document.getElementById('newnumberhere').appendChild(labelTd);
    document.getElementById('newnumberhere').appendChild(tdDetails);

    // Set add button disabled, to prevent new fields.
    var createButton = document.getElementById("create_new_phone");
    createButton.disabled = true;
}

function deleteForm() {

    var labelTd = document.getElementById("labelTd");
    labelTd.outerHTML = "";
    delete labelTd;

    var tableDetails = document.getElementById("td_details");
    tableDetails.outerHTML = "";
    delete tableDetails;

    // Allow to add new phones
    document.getElementById("create_new_phone").disabled = false;
}
