let getLocationsFromIndexTable = function (start, end, timezone, callback) {
    events = [];
    evant = [];
    $('#location-indextable tbody tr').each(function () {
        evant = {
            id: $(this).data("id"),
            street: $(this).data("street"),
            postcode: $(this).data("postcode"),
            city: $(this).data("city"),
            country: $(this).data("country"),
            streetNumber: $(this).data("streetNumber"),
            createdAt: $(this).data("createdAt"),
            updatedAt: $(this).data("updatedAt"),
            changedBy: $(this).data("changedBy")
        };
        events.push(evant);
    });
    return events;
};
let showModalWithEventData = function (evant) {
    if($('#locationModal').length){
        $('#locationModal span.street').text(evant.street);
        $('#locationModal, span.postcode').text(evant.postcode);
        $('#locationModal span.city').text(evant.city);
        $('#locationModal, span.country').text(evant.country);
        $('#locationModal span.createdAt').text(evant.createdAt);
        $('#locationModal, span.updatedAt').text(evant.updatedAt);
        $('#locationModal span.changedBy').text(evant.changedBy);
        let data = {evant:evant};
        let edit = $("#locationModal form.locationeditbutton");
        let del = $("#locationModal form.locationedeletebutton");
        edit.attr("action","admin/locations"+evant.id+"edit");
        edit.children('.locationeditbutton').attr("value","Edit");
        edit.off("ajax:success");
        edit.off("ajax:error");
        edit.on("ajax:error", function (xhr, status, error) {

        });
        edit.on("ajax:success", null, data, function (xhr, status) {

        });
        console.log("hi");
    }

};

$(document).ready(function () {
   showModalWithEventData(getLocationsFromIndexTable());
});