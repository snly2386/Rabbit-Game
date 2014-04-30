
 $(document).ready(function(){
$('#reg').on('click',function(){
  $('.newform').slideDown('slow')


$('.roll').on('click', function(){
if ($('li').html().match(/^paws$/)) {
  $('.roll').append("<img src='blast.png'/>")
}
});
});
});


