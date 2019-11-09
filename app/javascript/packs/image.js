
$(function(){
  window.onload = function(e){
    $(document).on('change','input[type=file]',function(e) {
      var file = $(this).prop('files')[0];
      var parent = $(this).parent('label');
      var image_id = $(parent).attr('id');
      var doc = document.getElementById(image_id);
      var image_container = $(this).parent().parent()
      var image_container_id = $(image_container).attr('id')
      $(parent).css('display', 'none')

      console.log(image_container_id)

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
            $(image_container).prepend(html);
          } else {
            $(image_container).append(html);
          }
        };
      })
    })

    $(document).on('click', '.item-image__operetion--delete', function(e) {
      var target_image = $(this).parent().parent()
      var label_doc_1 = $(target_image).siblings('#image_1')
      var label_doc_2 = $(target_image).siblings('#image_2')
      var ttt = target_image.attr('id')
      if (ttt == "image_1_target"){
        $(label_doc_1).css('display', 'block')
        $(label_doc_1).children('input[type=file]').val(null)
      } else {
        $(label_doc_2).css('display', 'block')
        $(label_doc_2).children('input[type=file]').val(null)
      }
      target_image.remove()
    })
  }
})