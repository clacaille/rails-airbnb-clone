$(document).ready(function() {
  $(function(){
    $(".tab").on("click", function(e){
      // Change active tab
      $("div a").removeClass('active');
      $(this).addClass('active');
      // Hide all tab-content (use class="hidden")
       $(".tab-content").addClass('hidden');
      // Show target tab-content (use class="hidden")
      $($(this).data('target')).removeClass('hidden');
    });
  });
});
