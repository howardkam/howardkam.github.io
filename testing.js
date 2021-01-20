var json = {
    "faculty": [{
            "name": "kam",
            "instructions": "none",
            "ared": "https://meet.google.com/lookup/czn7nat22h",
            "agold": "https://meet.google.com/lookup/czn7nat22h",
            "1red": "https://meet.google.com/lookup/czn7nat22h",
            "1gold": "https://meet.google.com/lookup/czn7nat22h",
            "2red": "none",
            "2gold": "none",
            "3red": "none",
            "3gold": "none",
            "4red": "https://meet.google.com/lookup/czn7nat22h",
            "4gold": "https://meet.google.com/lookup/czn7nat22h"
            1,
            "5red": "https://meet.google.com/lookup/czn7nat22h",
            "5gold": "https://meet.google.com/lookup/czn7nat22h",
            "6red": "https://meet.google.com/lookup/czn7nat22h",
            "6gold": "https://meet.google.com/lookup/czn7nat22h",
            "7red": "https://meet.google.com/lookup/czn7nat22h",
            "7gold": "https://meet.google.com/lookup/czn7nat22h"
        }
        // {
        //     "address": "61 Park Avenue",
        //     "num1": 5,
        //     "num2": 2
        // },
        // {
        //     "address": "585 Park Road",
        //     "num1": 3,
        //     "num2": 1
        // }
    ]

};

function gid(e) {
    return document.getElementById(e);
}

function dosearch() {
    var n = gid('teacher').value
    n.toLowerCase();
    var a = json["faculty"];
    for (var i = 0; i < a.length; ++i) {
        var a_i = a[i];
        if (a_i["name"] == n) {
            gid('notes').innerHTML = "Located";
        } else {
            gid('notes').innerHTML = "Enter the complete last name";
        }
    }
}