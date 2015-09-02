/**
 * 
 */
	jQuery(function($){
	// Lined Tab Navigation
	var $tab_line = $('.tab.line');
	$tab_line.removeClass('jx').find('ul ul').hide();
	$tab_line.find('li li.active').parents('li').addClass('active');
	$tab_line.find('li.active>ul').show();
	function lineTabMenuToggle(event){
		var $this = $(this);
		$this.next('ul').show().parent('li').addClass('active').siblings('li').removeClass('active').find('>ul').hide();
		if($this.attr('href') === '#'){
			return false;
		}
	}
	function lineTabSubMenuActive(){
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');
		if($this.attr('href') === '#'){
			return false;
		}
	}; 
	$tab_line.find('>ul>li>a').click(lineTabMenuToggle).focus(lineTabMenuToggle);
	$tab_line.find('li li>a').click(lineTabSubMenuActive).focus(lineTabSubMenuActive);
	});

var faq = {
	toggle : function() {
		
	}
}
