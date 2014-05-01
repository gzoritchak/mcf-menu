class MenuItem
  constructor: (@title) ->
    @sousMenus = []


class MenuBuilder
  constructor: ->
    @sousMenus = []

  menu: (title) ->
    child = new Menu(title, @)
    @sousMenus.push child
    child

  breadCrumb: (url)->
    'Accueil / Santé / CMU ou Lamal'

  asHtml: -> @sousMenus.reduce ((acc, m) -> acc + m.asHtml()), ""

class Menu extends MenuItem
  constructor: (@title, @parent) ->
    super(@title)

  subM: (url, title) ->
    @sousMenus.push new SMenu(title, @, url)
    @

  menu: (title) ->
    @parent.menu(title)

  asHtml: ->
    smenus = @sousMenus.reduce ((acc, m) -> acc + m.asHtml() + "\n"), ""
    '<li><a href=\"\" data-toggle=\"dropdown\">#{@title}</a><ul>' + smenus + '</ul></li>'


class SMenu extends MenuItem
  constructor: (@title, @parent, @url = '') ->
    super(@title)

  asHtml: -> "<li><a href='/#{@url}/'>#{@title}</li>"

module.exports = MenuBuilder


