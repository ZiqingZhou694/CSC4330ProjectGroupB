$("#logout").click(function () {
    $.ajax({
        url: "/logout",
        type: "POST",
        data: {

        },
        resultType: "JSON",
        success: function (result) {
            console.log(result);
            window.location.href = "login"
        },
        error: function (result) {
            console.log(result);
            window.location.href = "login"

        }
    });
});