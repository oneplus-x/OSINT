function get_location() {
    var bssid = document.getElementById('wifi-bssid').value
    fetch("https://bssid-locator.herokuapp.com/getLocation?bssid=" + bssid)
        .then(function (response) {
            let data = response.json()
            return data
        }).then(function (data) {
            var Longitude = document.getElementById("Longitude")
            var Latitude = document.getElementById("Latitude")
            var google_map = document.getElementById("google-map")

            if (data['status'] == "200") {
                Longitude.innerText = data["longitude"]
                Latitude.innerText = data["latitude"]
                google_map.innerText = "https://www.google.com/maps/place/" + data["latitude"] + "," + data["longitude"]
                document.getElementById('result').scrollIntoView();
            } else {
                alert("The Given BSSID not available in Apple's Database")
            }
        })
}

