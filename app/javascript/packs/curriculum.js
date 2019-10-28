$(function(){
  var view=$('#iframe');
  var editor = ace.edit("editor");
    editor.$blockScrolling = Infinity;
    editor.setTheme("ace/theme/monokai");
    document.getElementById('editor').style.fontSize='12px';
    editor.getSession().setMode("ace/mode/html");
    editor.setOptions({
      enableBasicAutocompletion: true,
      enableSnippets: true,
      enableLiveAutocompletion: true
    });

    editor.getSession().on('change', function () {
      view.contents().find('body').html(editor.getSession().getValue());
    });

    $('#font-size').click(function(e) {
      editor.setFontSize($(e.target).data('size'));
    });
    $('#bold').click(function(e) {
      editor.insert('<strong>' + editor.getCopyText() + '</strong>');
    });
    $('#save').click(function(e) {
      localStorage.text = editor.getValue();
      alert("保存しました。");
    });
    $('#load').click(function(e) {
      if (!confirm("読み込みますか？")) return;
      editor.setValue(localStorage.text, -1);
    });

    $('.js-modal-open').on('click',function(){
      $('.js-modal1').fadeIn();
      return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal1').fadeOut();
        return false;
    });

   $(window).on('load', function() {
    $('#modal').fadeIn();
    $('.js-mo').fadeOut();
    return false;
   });

})


