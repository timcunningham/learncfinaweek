$(document).ready(function(){
	$.each($( '.wysiwyg' ), function(i, v){
		var editor = CKEDITOR.replace( v );
	});
	
	
	$('#contributorModal').modal({
		show:false
	});
	
	$('#contributorModal').on('hidden', function () {
	  $('#modalHeader').html('');
			$('#modalBody img').attr('src','');
			$('#modalBody p').html('');
	});
	
	$('.contributorBio').click(function(){
		var id=$(this).attr('id');
		
		$('#modalHeader').html($('#name_' + id).html());
		$('#modalBody img').attr('src','/assets/img/contributor/large/' + $('#photo_' + id).val());
		$('#modalBody p').html($('#bio_' + id).val());
		$('#contributorModal').modal('show')
	});
	
	$('#authorModal').modal({
		show:false
	});
	
	$('#authorBioLink').click(function(){
		$('#authorModal').modal('show')
	});
	
	
	$('#toggle').click(function(){
		$.ajax({
		  url: '/com/service/navigationService.cfc?method=toggleNavigation',
		  success: function(data) {
		    if($('#aside-conteiner').is(':visible')){
				$('#aside-conteiner').hide();
				$('#toggle').html('&gt;&gt;');
			}else{
				$('#aside-conteiner').show();
				$('#toggle').html('&lt;&lt;');
			}
			$('.page-content div').toggleClass('twelve sixteen');
			
		  }
		});
	});
});