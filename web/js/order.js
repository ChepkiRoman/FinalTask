ymaps.ready(init);

var begin, end, length;


function init() {
    // order
    $('#drivers').hide();

    var myMap = new ymaps.Map('map', {
            center: [53.899191, 27.553824],
            zoom: 13,
            controls: []
        }),
        // price calculator panel
        routePanelControl = new ymaps.control.RoutePanel({
            options: {
                // add a title
                showHeader: true,
                title: 'Select route'
            }
        }),
        zoomControl = new ymaps.control.ZoomControl({
            options: {
                size: 'small',
                float: 'none',
                position: {
                    bottom: 145,
                    right: 10
                }
            }
        });

    // only car routes allowed
    routePanelControl.routePanel.options.set({
        types: {auto: true}
    });

    myMap.controls.add(routePanelControl).add(zoomControl);

    // get a route link
    routePanelControl.routePanel.getRouteAsync().then(function (route) {

        // routing end handler
        route.model.events.add('requestsuccess', function () {

            var activeRoute = route.getActiveRoute();
            if (activeRoute) {
                // get distance
                 length = route.getActiveRoute().properties.get("distance");

                end = route.getWayPoints().get(0).geometry.getCoordinates();
                begin = route.getWayPoints().get(1).geometry.getCoordinates();


            }

        });

    });


}

function createOrder() {

    $.ajax({
        url: 'FrontController?command=CREATE_ORDER',
        type: 'POST',
        data: {
            x: begin[0],
            y: begin[1],
            distance: length,
        },
        success: function() {location.reload()},
        error: function () {
            alert("error")
        }
    });



    // var x = document.getElementById("mapContainer");
    // x.style.display = "none";
    //

}


