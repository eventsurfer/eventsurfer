const prefix = "location";

let showModalWithEventData = function () {
    let data = Object.entries($(this).data());
    for (let i = 0; i < data.length; i++) {
        let attribute = data[i][0].toLowerCase();
        if (attribute.includes(prefix)) {
            $('#locationModal span.' + attribute.replace(prefix, "")).text(data[i][1]);
        }
    }
    let edit = $("#locationeditbutton");
    let del = $("#locationedeletebutton");
    edit.attr("href", "/admin/locations/" + $(this).data("locationId") + "/edit");
    del.attr("href", "/admin/locations/" + $(this).data("locationId") + "/delete");
    edit.off("ajax:success");
    edit.off("ajax:error");
    edit.on("ajax:error", function (xhr, status, error) {

    });
    //edit.on("ajax:success", null, data, function (xhr, status) {

    //});
    $('#locationModal').modal();
};

$(document).ready(function () {
    $("<div id=\"locationModal\" class=\"modal fade\" role=\"dialog\">\n" +
        "  <div class=\"modal-dialog\">\n" +
        "    <div class=\"modal-content\">\n" +
        "      <div class=\"modal-header\">\n" +
        "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n" +
        "        <h5 class=\"modal-title\" id=\"#locationModalLabel\">Modal Header</h5>\n" +
        "      </div>\n" +
        "      <div class=\"modal-body\">\n" +
        "        <p>Ein netter Text <span class=\"street\">STREET</span> <span class=\"postcode\">POSTCODE</span> <span class=\"city\">CITY</span> <span class=\"country\">COUNTRY</span> <span class=\"streetnumber\">STREETNUMBER</span> <span class=\"createdat\">CREATED AT</span> <span class=\"updatedat\">UPDATED AT</span> <span class=\"changedby\">CHANGED BY</span></p>\n" +
        "      </div>\n" +
        "      <div class=\"modal-footer\">\n" +
        "        <a id='locationeditbutton' href='#' class=\"btn btn-secondary\" role=\"button\">Edit</a>\n" +
        "        <a id='locationedeletebutton' href='#' class=\"btn btn-danger\" role=\"button\">Delete</a>\n" +
        "        <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>").appendTo("body");

    $("tr[data-location-link]").click(showModalWithEventData);
});