$(document).ready(function(){
  // $("body").click(function(){
  //   alert("hello!");
  // });
  
  var total = 0;
  var options_total = 0;
  var package_price = 0;

  var total_box = $(".total-box");

  $(".motor-package-radio").click(function(){
    package_price = $(this).val();
    total = package_price + options_total
    total_box.val(total);
  });

})