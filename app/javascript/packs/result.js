

$(function(){

  function frameClick() {
    document.location.href = "https://www.google.com/";
  }

  $('.result-btn').click(function(){
    var dom_sample = document.getElementById('iframe')
    var body_sample = dom_sample.contentWindow.document.querySelector('body')
    var sample = $(body_sample).html()
    var sm = sample.replace(/\s+/g, "")

    var dom_result = document.getElementById('result_iframe')
    var body_result = dom_result.contentWindow.document.querySelector('body')
    var result = $(body_result).html()
    var re = result.replace(/\s+/g, "")
    var error = $('div').hasClass('ace_error')

    if (sm===re && error==false) {
      $('.js-modal2').fadeIn();
    } else {
      $('.js-modal3').fadeIn();
    }
  })

  $('.js-modal-close').on('click',function(){
    $('.js-modal2').fadeOut();
    $('.js-modal3').fadeOut();
    return false;
  });

})
