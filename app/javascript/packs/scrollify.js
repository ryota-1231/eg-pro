$(function(){
  $.scrollify({section:".box"});
  console.log('in');
  $(window).on('resize',function(){
  $.scrollify.update();
  console.log('in');
  });
  });	


