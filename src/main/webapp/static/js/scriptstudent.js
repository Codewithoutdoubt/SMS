function removeDuplicateOptions(selectElement) {
    const seen = new Set();
    const options = Array.from(selectElement.options);

    options.forEach(option => {
        if (seen.has(option.value)) {
            option.remove();  // Remove duplicate option
        } else {
            seen.add(option.value);  // Add unique value to the Set
        }
    });
}

// Call the function to remove duplicates
const selectElement = document.getElementById('academicYear');
removeDuplicateOptions(selectElement);

function assesndingorder() {
    var select = document.getElementById('academicYear');
    var options = Array.from(select.options);
    options.sort(function (a, b) {
        return a.value - b.value;
    });
    while (select.firstChild) {
        select.removeChild(select.firstChild);
    }
    options.forEach(function (option) {
        select.appendChild(option);
    });
}
assesndingorder();
var personal = document.getElementById('personal'),
    row = document.getElementById('row');



personal.onclick = function () {
    'use strict';
    row.style.display = 'block';
    ahmd.style.display = 'none';
    sasa.style.display = 'none';
    eissa.style.display = 'none';

};

/**/
var edu = document.getElementById('edu'),

    ahmd = document.getElementById('ahmd');

edu.onclick = function () {
    'use strict';
    ahmd.style.display = 'block';
    row.style.display = 'none';
    eissa.style.display = 'none';
    sasa.style.display = 'none';

};
/**/
var notif = document.getElementById('notif'),

    eissa = document.getElementById('eissa');

notif.onclick = function () {
    'use strict';
    eissa.style.display = 'block';
    row.style.display = 'none';
    ahmd.style.display = 'none';
    sasa.style.display = 'none';
};
/**/
var chat = document.getElementById('chat'),

    sasa = document.getElementById('sasa');

chat.onclick = function () {
    'use strict';
    sasa.style.display = 'block';
    row.style.display = 'none';
    ahmd.style.display = 'none';
    eissa.style.display = 'none';
};

// Function to remove duplicate options





