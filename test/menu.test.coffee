# test/calculator.test.coffee

MenuBuilder = require '../index'

exports.MenuTest =

  'Test Bread crumb': (test) ->
    root = new MenuBuilder()
    root
      .menu 'Santé'
        .subM('comparaison-cmu-lamal', 'CMU ou Lamal')

    bread = root.breadCrumb ('comparason-cmu-lamal')
    test.equal(bread, 'Accueil / Santé / CMU ou Lamal')
    console.log root
    test.done()


  'Test générer menu': (test) ->
    root = new MenuBuilder()
    root
      .menu 'Santé'
        .subM 'comparaison-cmu-lamal' , 'CMU ou Lamal'
        .subM 'cmu-lamal' , 'CMU et Lamal'

    html = root.asHtml()
    console.log html
    test.done()

  'Mapping des pages': (test) ->
    mb = new MenuBuilder()
    mb
      .menu 'contact', 'Contact'

    mappings = mb.mappings()
    test.equals( {url:'contact', title:'Contact'}, mappings)
    test.done()

  'Construction menu': (test) ->
      menu = m('H1', '/',[])
      console.log menu
      test.done()


