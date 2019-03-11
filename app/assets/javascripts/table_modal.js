$(document).ready(function () {
    $("<div class=\"modal\" id=\"tableModal\">" +
        "  <div class=\"modal-dialog\">" +
        "    <div class=\"modal-content\">" +
        "      <div class=\"modal-header\">" +
        "        <h4 class=\"modal-title\"></h4>" +
        "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>" +
        "      </div>" +
        "      <div class=\"modal-body\">" +
        "        <table class=\"table\">" +
        "           <tbody>" +
        "           </tbody>" +
        "        </table>" +
        "      </div>" +
        "      <div class=\"modal-footer\">" +
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
        let modalTitle = tableModal.find(".modal-title").first();
        let modalBody = tableModal.find("table tbody").first();
        let modalFooter = tableModal.find(".modal-footer").first();
        let values = $(this).children("td");

        modalBody.empty();
        modalFooter.empty();
        let table = $(this).parents("table").first();
        table.find("thead tr th").each(function (i) {
            let head = $(this);
            let type = head.attr("data-modal");
            if (type !== "false") {
                if (type === "button") {
                    modalFooter.prepend($(values[i]).html());
                } else {
                    modalBody.append("<tr><th scope=\"row\">" + head.html() + "</th><td>" + $(values[i]).html() + "</td></tr>");
                }
            }
        });
        modalTitle.text(table.attr("data-name"));
        modalFooter.append("<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button>");

        tableModal.modal();
    }
});