
$(function(){
  window.onload = function(e){
    $(document).on('change','input[type=file]',function(e) {
      var file = $(this).prop('files')[0];
      var parent = $(this).parent('label');
      var image_id = $(parent).attr('id');
      var doc = document.getElementById(image_id);
      $(doc).css('display', 'none')   

      $.each(this.files, function(i,input){
        var fr = new FileReader();
        fr.readAsDataURL(file);
        fr.onload = function() {
          var src = fr.result
          var html =`<div class='item-image' id="${image_id}_target" data-image="${file.name}">
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src}  >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
          if (image_id == "image_1"){
            $('#image-box__container').prepend(html);
          } else {
            $('#image-box__container').append(html);
          }
        };
      })
    })

    $(document).on('click', '.item-image__operetion--delete', function(e) {
      var target_image = $(this).parent().parent()
      var ttt = target_image.attr('id')
      var target_label_1 = document.getElementById("image_1")
      var target_label_2 = document.getElementById("image_2")
        if (ttt == "image_1_target"){
          $(target_label_1).css('display', 'block')
          $(target_label_1).children('input[type=file]').val(null)
        } else {
          $(target_label_2).css('display', 'block')
          $(target_label_2).children('input[type=file]').val(null)
        }
      target_image.remove()
    })
  }
})