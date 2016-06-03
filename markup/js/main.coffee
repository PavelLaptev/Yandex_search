console.clear()

flag = 1

#Search box
$('.icon-input__clear').click ->
	$('.search-input').val('')
	$('.search-input').focus()

$('.header__bar > a').hover ->
	$(@).css
		'transition': 'box-shadow 0.2s'

$('.header__bar__link').hover ->
	if flag is 1 and $('.header__bar__link').not('link_move')
		flag = 0
		$(@).addClass('link_move')

$('.header__bar__link').draggable
	revert: true
	revertDuration: 60
	start: ->
		$('.search-input').addClass('search-input__drop-active')
	stop: ->
		$('.search-input').removeClass('search-input__drop-active')

$('.search__wrap__input-box').droppable
	drop: (event, ui) ->
		ui.draggable.draggable('disable')
		if ui.draggable.hasClass('header__bar__link__disable')
			console.log('has')
		else
			ui.draggable.text(ui.draggable.text() + ":")
		ui.draggable.addClass('header__bar__link__disable')
		ui.draggable.appendTo($(@))
		$('.search-input').css
			'padding': '0 90px 0 ' + ($('.header__bar__link__disable').outerWidth(true) + 26) + 'px'
		$('.header__bar__hold').css
			"background": "transparent"

#Popup
flag = 1
popup = $('.popup')

$('.search__body__result__item__options span').click ->
	spanPos = $(@).offset()
	$('.popup__search-path a').text($(@).attr('value'))
	popup.css
		display: "flex"
		top: spanPos.top - 18
		left: spanPos.left - 18
	.animate {
		opacity: 1
	}, 150

popup.hover -> flag ^= 1

$(document).on 'mouseup keyup', (e) ->
  if flag or e.which == 27
    popup.fadeOut(100)

#scroll
$(window).scroll ->
	if $(window).scrollTop() > 200
		$('.search').addClass('search__scroll')
		$('.search-button').addClass('search-button__scroll')
		$('.header__bar').addClass('header__bar__scroll')
		$('.header__bar__hold').addClass('header__bar__hold__scroll')
		$('.header__bar__link').addClass('header__bar__link__scroll')
		$('.icon-input__settings').addClass('icon-input__settings__scroll')
		$('.icon-input__clear').addClass('icon-input__clear__scroll')
		$('.header__back').addClass('header__back__scroll')
	else
		$('.search').removeClass('search__scroll')
		$('.search-button').removeClass('search-button__scroll')
		$('.header__bar').removeClass('header__bar__scroll')
		$('.header__bar__hold').removeClass('header__bar__hold__scroll')
		$('.header__bar__link').removeClass('header__bar__link__scroll')
		$('.icon-input__settings').removeClass('icon-input__settings__scroll')
		$('.icon-input__clear').removeClass('icon-input__clear__scroll')
		$('.header__back').removeClass('header__back__scroll')

#focus on input
$('.search-input').focus ->
	$('.search').removeClass('search__scroll')
	$('.search-button').removeClass('search-button__scroll')
	$('.header__bar').removeClass('header__bar__scroll')
	$('.header__bar__hold').removeClass('header__bar__hold__scroll')
	$('.header__bar__link').removeClass('header__bar__link__scroll')
	$('.icon-input__settings').removeClass('icon-input__settings__scroll')
	$('.icon-input__clear').removeClass('icon-input__clear__scroll')
	$('.header__back').removeClass('header__back__scroll')