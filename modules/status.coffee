class StatusModule extends BotModule
  init: ->
    try
      @player = Core.modules.loaded['player']
    catch e
      throw new Error 'This module must be loaded before the player module.'

  ready: ->
    if Core.properties.debug
      Core.bot.user.setPresence status: 'dnd', game: name: Core.properties.version
    else
      Core.bot.user.setPresence {
        status: 'online'
        game: name: "#{Core.properties.prefix}help | Current Song =" + player.queue.nowPlaying
      }

module.exports = StatusModule
