$(document).on("click", ".alert", function(e) {
  bootbox.alert("Hello world!", function() {
    console.log("Alert Callback");
  });
});