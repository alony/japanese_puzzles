(function($) {
  $.fn.PuzzleGrid = function() {
    var click_class = 'checked';
		
    this.find("td").click( function() {
      $(this).toggleClass(click_class);  
      return false;
    });
  }
})(jQuery);  



$(document).ready(function() {
	$("#edit table").PuzzleGrid();
});