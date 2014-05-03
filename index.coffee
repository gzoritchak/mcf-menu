class MenuItem
  constructor: (@title) ->
    @sousMenus = []



class MenuBuilder
  constructor: ->
    @sousMenus = []

  @m: (title, url, sms) ->
    menu = new Menu(title, null, url)
    sms.reduce ((acc,m) -> acc push m), menu.sousMenus
    menu


  menu: (title, url= '') ->
    child = new Menu(title,@, url)
    @sousMenus.push child
    child

  mappings: -> @sousMenus.reduce {url:'', title:''}


  breadCrumb: (url)->
    'Accueil / Santé / CMU ou Lamal'

  asHtml: -> @sousMenus.reduce ((acc, m) -> acc + m.asHtml()), ""

class Menu extends MenuItem
  constructor: (@title, @parent, @url = '') ->
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

#  mapping: -> @url , @title

module.exports = MenuBuilder


