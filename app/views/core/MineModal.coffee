require('app/styles/modal/mine-modal.sass')
ModalView = require 'views/core/ModalView'
template = require 'app/templates/core/mine-modal'
Products = require 'collections/Products'
storage = require 'core/storage'

# define expectations for good rates before releasing

module.exports = class MineModal extends ModalView
  id: 'mine-modal'
  template: template
  hasAnimated: false
  events:
    'click #close-modal': 'hide'
    'click #buy-now-button': 'onBuyNowButtonClick'
    'click #submit-button': 'onSubmitButtonClick'

  onBuyNowButtonClick: (e) =>
    window.tracker?.trackEvent "Mine Explored", engageAction: "buy_button_click"
    $("#buy-now-button").hide()
    $("#submit-button").show()
    $("#details-header").text("Thanks for your interest")
    $("#info-text").hide()
    $("#capacity-text").show()

  onSubmitButtonClick: (e) ->
    storage.save('roblox-clicked', true)
    window.tracker?.trackEvent "Roblox Explored", engageAction: "submit_button_click"
    @hide()

  destroy: ->
    $("#modal-wrapper").off('mousemove')
    super()
