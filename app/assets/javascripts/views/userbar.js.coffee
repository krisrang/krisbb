"use strict";

window.KrisBB.Views.Userbar = Backbone.Marionette.ItemView.extend
  template: JST["templates/userbar"]
  presenceTemplate: JST["templates/presence-row"]
  presenceChannel: null
  className: 'userbar'

  ui:
    presenceList  : '.user-presence ul'
    allowButton   : '.allow-notifications'

  events:
    'click .allow-notifications'  : 'onClickAllow'

  initialize: ->
    KrisBB.Vent.bind 'pusher:presence_subscribed', (presence) =>
      @presenceChannel = presence
      @renderPresence presence.members

    KrisBB.Vent.bind 'pusher:joined', (member, presence) =>
      @onPresenceJoined member

    KrisBB.Vent.bind 'pusher:left', (member, presence) =>
      @onPresenceLeft member

  onShow: ->
    if !!webkitNotifications && webkitNotifications.checkPermission() != 0
      @ui.allowButton.show()

  onClickAllow: (e) ->
    webkitNotifications.requestPermission () =>
      if webkitNotifications.checkPermission() == 0
        console.log "Notifications allowed"
        @ui.allowButton.hide()
    return

  renderPresence: (members) ->
    list = ""
    members.each (member) =>
      list += @presenceTemplate(member)

    @ui.presenceList.html list
    @ui.presenceList.find('[rel=tooltip]').tooltip()

  onPresenceJoined: (member) ->
    if @ui.presenceList.find('#presence-' + member.id).length == 0
      el = $(@presenceTemplate(member))
      el.appendTo(@ui.presenceList)
      el.find('[rel=tooltip]').tooltip()

  onPresenceLeft: (member) ->
    el = @ui.presenceList.find('#presence-' + member.id)

    if el.length > 0
      el.find('[rel=tooltip]').tooltip('destroy')
      el.remove()
