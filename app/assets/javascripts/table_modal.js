$(document).ready(function () {
    $("<div class=\"modal\" id=\"tableModal\">" +
        "  <div class=\"modal-dialog\">" +
        "    <div class=\"modal-content\">" +
        "      <div class=\"modal-header\">" +
        "        <h4 class=\"modal-title\">Modal Heading</h4>" +
        "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>" +
        "      </div>" +
        "      <div class=\"modal-body\">" +
        "        <table class=\"table\">" +
        "           <tbody>" +
        "           </tbody>" +
        "        </table>" +
        "      </div>" +
        "      <div class=\"modal-footer\">" +
        "        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "</div>").appendTo("body");

    $("table[data-modal=true]").each(function () {
        $(this).children("tbody").find("tr").each(function () {
            $(this).click(openModal);
        });
    });

    function openModal() {
        let tableModal = $("#tableModal").first();
        let body = tableModal.find("table tbody").first();
        let values = $(this).children("td");

        body.empty();
        $(this).parents("table").first().find("thead tr th").each(function (i) {
            body.append("<tr><th scope=\"row\">" + $(this).text() + "</th><td>" + $(values[i]).text() + "</td></tr>");
        });

        tableModal.modal();
    }
});