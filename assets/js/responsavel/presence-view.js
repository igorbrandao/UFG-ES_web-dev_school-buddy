$(document).ready(function () {

	$('.table tr').css('display', 'none');
	$('.table tr[data-status=all]').fadeIn('slow');
    $('.table tr[data-status=segunda]').fadeIn('slow');

    $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
            $('.table tr').css('display', 'none');
			$('.table tr[data-status=all]').fadeIn('slow');
            $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
			$('.table tr[data-status=all]').fadeIn('slow');
            $('.table tr').css('display', 'none').fadeIn('slow');
        }
    });
});
